import sys
import datetime as dt

import numpy as np
import pandas as pd
import nsepy


class LineBreak:

    LINE_NUMBER = 3
    PRICE_MOVEMENT = 2

    TREND_CHANGE_DIFF = 2

    required_columns = {'open', 'high', 'low', 'close'}

    def __init__(self, df):
        self.odf = df
        self.df = df
        self._validate_df()

    def _validate_df(self):
        if not self.required_columns.issubset(self.df.columns):
            raise ValueError('DataFrame should have OHLC {} columns'.format(self.required_columns))

    def get_chart_data(self):
        self.df = self.df[['date', 'open', 'high', 'low', 'close']]

        print('ooooooooooooooooooooooo')
        print(self.df.tail(22))

        self.df.loc[:, 'close_s1'] = self.df['close'] - self.df['close'].shift(1)
        self.df.loc[:, 'close_s2'] = self.df['close'] - self.df['close'].shift(2)

        columns = ['date', 'open', 'high', 'low', 'close', 'uptrend']

        self.cdf = pd.DataFrame(
            columns=columns,
            data=[],
        )

        uptrend = True
        uptrend = False

        for index, row in self.df.iterrows():
            if uptrend and row['close'] > self.df.iloc[index - 1]['close']:
                r = [
                    row['date'],
                    self.df.iloc[index - 1]['close'],
                    row['close'],
                    self.df.iloc[index - 1]['close'],
                    row['close'],
                ]

            elif uptrend and (
                    row['close'] < self.df.iloc[index - 1]['close'] and \
                    row['close'] < self.df.iloc[index - 2]['open']
                    ):
                uptrend = not uptrend
                r = [
                    row['date'],
                    self.df.iloc[index - 1]['open'],
                    self.df.iloc[index - 1]['open'],
                    row['close'],
                    row['close'],
                ]

            elif not uptrend and row['close'] < self.df.iloc[index - 1]['close']:
                r = [
                    row['date'],
                    self.df.iloc[index - 1]['close'],
                    self.df.iloc[index - 1]['close'],
                    row['close'],
                    row['close'],
                ]

            elif not uptrend and (
                    row['close'] > self.df.iloc[index - 1]['close'] and \
                    row['close'] > self.df.iloc[index - 2]['open']
                    ):
                uptrend = not uptrend
                r = [
                    row['date'],
                    self.df.iloc[index - 1]['open'],
                    row['close'],
                    self.df.iloc[index - 1]['open'],
                    row['close'],
                ]
            else:
                continue


            sdf = pd.DataFrame(data=[[*r, uptrend]], columns=columns)

            self.cdf = pd.concat([self.cdf, sdf])

        print(self.cdf.tail(22))
        print('======================')

    def filter_noise(self):

        while True:
            self.update_ohlc()
            filtered_df = self.df[self.df['trend'] != 0]

            if len(self.df) == len(filtered_df):
                break
            else:
                print('noise')
            self.df = filtered_df

    def update_ohlc(self):
        self.df.loc[:, 'close_s1'] = self.df['close'].shift(1)
        self.df.loc[:, 'close_s2'] = self.df['close'].shift(2)

        low = (self.df['close'] < self.df['close_s1']) & (self.df['close'] < self.df['close_s2'])
        # low = self.df['close'] < self.df['close_s2']
        self.df.loc[low, 'close_l'] = self.df['close']
        self.df.loc[low, 'trend'] = -1

        high = (self.df['close'] > self.df['close_s1']) & (self.df['close'] > self.df['close_s2'])
        # high = self.df['close'] > self.df['close_s2']
        self.df.loc[high, 'close_l'] = self.df['close']
        self.df.loc[high, 'trend'] = 1


if len(sys.argv) > 1:
    fname = sys.argv[1]
    print('Reading local file {}'.format(fname))
    df = pd.read_csv(sys.argv[1])
else:
    symbol='SBIN'
    print('Downloading {} data from nsepy'.format(symbol))
    df = nsepy.get_history(
        symbol=symbol,
        start=dt.date(2017,1,1),
        end=dt.date(2018,1,19)
    )
    if df.empty:
        print('No data is received from nsepy. Exiting...')
        sys.exit()


df.reset_index(inplace=True)
df.columns = [i.lower() for i in df.columns]


lb = LineBreak(df)
d = lb.get_chart_data()
print(d)
