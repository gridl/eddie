"""
Usage:

df = pd.read_csv("data.csv")
renko = Renko(df)

renko.brick_size = 2
bricks = renko.get_bricks()
print(bricks)
"""

import sys
import datetime as dt

import numpy as np
import pandas as pd
import nsepy


class Renko:

    PERIOD_CLOSE = 1
    PRICE_MOVEMENT = 2

    TREND_CHANGE_DIFF = 2

    brick_size = 1
    chart_type = PERIOD_CLOSE

    required_columns = {'open', 'high', 'low', 'close'}

    def __init__(self, df):
        self.df = df
        self._validate_df()
        self.rdf = df
        self.bdf = None

    def _validate_df(self):
        if not self.required_columns.issubset(self.df.columns):
            raise ValueError('DataFrame should have OHLC {} columns'.format(self.required_columns))

    def get_bricks(self):
        if self.chart_type == self.PERIOD_CLOSE:
            self.period_close_bricks()
        else:
            self.price_movement_bricks()

        return self.bdf

    def period_close_bricks(self):
        brick_size = self.brick_size
        self.rdf = self.rdf[['date', 'close']]

        self.rdf.loc[:, 'close_s1'] = self.rdf['close'] - self.rdf['close'].shift()
        # self.rdf.dropna(inplace=True)

        self.rdf.loc[:, 'close_r'] = (self.rdf['close'] // self.brick_size) * self.brick_size
        self.rdf.loc[:, 'close_r_s1'] = (self.rdf['close_s1'] // self.brick_size) * self.brick_size

        self.filter_noise()

        bricks = self.rdf['bricks']
        asign = np.sign(bricks)
        self.rdf.loc[:, 'rtc'] = ((np.roll(asign, 1) - asign) != 0).astype(int)

        self.rdf.loc[:, 'u_bricks'] = self.rdf.loc[self.rdf['rtc'] == 1, 'bricks']
        self.rdf.loc[:, 'u_bricks'] = self.rdf['u_bricks'].apply(
            lambda x: x - self.TREND_CHANGE_DIFF if x > 0 else x + self.TREND_CHANGE_DIFF
        )
        self.rdf.loc[self.rdf['rtc'] == 0, 'u_bricks'] = self.rdf['bricks']

        self.rdf = self.rdf[['close_r', 'u_bricks', 'date']]
        self.rdf = self.rdf[self.rdf['u_bricks'] != 0]
        self.rdf.reset_index(inplace=True)
        self.rdf.dropna(inplace=True)

        self.calculate_bricks_from_diff()
        self.shift_bricks()

    def shift_bricks(self):
        shift = self.df['close'].iloc[-1] - self.bdf['close'].iloc[-1]
        if abs(shift) < self.brick_size:
            return
        step = shift // self.brick_size
        self.bdf[['open', 'close']] += step * self.brick_size

    def calculate_bricks_from_diff(self):
        brick_size = self.brick_size

        columns = ['open', 'close', 'date']
        self.bdf = pd.DataFrame(
            columns=columns,
            data=[[0, 0, 0]],
        )

        prev_bricks = 1

        cls = (self.df['close'].iloc[0] // brick_size) * brick_size

        for index, row in self.rdf.iterrows():
            bricks = row['u_bricks']
            date = row['date']

            data = []

            for i in range(int(abs(bricks))):
                if prev_bricks * bricks < 0 and i == 0 :
                    cls = cls + brick_size * (bricks / abs(bricks))

                r = [
                    cls,
                    cls + (brick_size * (bricks / abs(bricks))),
                    date
                ]
                data.append(r)

                cls = r[1]
                prev_bricks = bricks

            # print(data)
            sdf = pd.DataFrame(data=data, columns=columns)

            self.bdf = pd.concat([self.bdf, sdf])

        return self.bdf


    def filter_noise(self):
        df = self.rdf
        brick_size = self.brick_size

        df.loc[:, 'cr_diff'] = df['close_r'] - df['close_r'].shift()
        df = df[df['cr_diff'] != 0]
        df.loc[:, 'bricks'] = df.loc[:, ('cr_diff', )] / brick_size
        df.loc[:, 'bricks_s1'] = df['bricks'].shift()
        df.loc[:, 'tc'] = np.where((df['bricks'] * df['bricks_s1']) < 0, True, False)


        while True:
            df.loc[:, 'cr_diff'] = df['close_r'] - df['close_r'].shift()
            df = df[df['cr_diff'] != 0]

            df['bricks'] = df.loc[:, ('cr_diff', )] / brick_size
            df['bricks_s1'] = df['bricks'].shift()
            df['tc'] = np.where((df['bricks'] * df['bricks_s1']) < 0, True, False)

            filtered_df = df[(~df['tc']) | ~(abs(df['bricks']) == 1)]
            if len(df) == len(filtered_df):
                break
            df = filtered_df


        self.rdf = df


if len(sys.argv) > 1:
    fname = sys.argv[1]
    print('Reading local file {}'.format(fname))
    df = pd.read_csv(sys.argv[1])
else:
    print('Downloading data from nsepy')
    df = nsepy.get_history(
        symbol='SBIN',
        start=dt.date(2017,1,1),
        end=dt.date(2018,1,19)
    )
    if df.empty:
        print('No data is received from nsepy. Exiting...')
        sys.exit()


df.reset_index(inplace=True)
df.columns = [i.lower() for i in df.columns]

renko = Renko(df)
renko.brick_size = 4
r = renko.get_bricks()
print(r.tail(20))
