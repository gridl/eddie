"""
Usage:

df = pd.read_csv("data.csv")
renko = Renko(df)

renko.brick_size = 2
bricks = renko.get_bricks()
print(bricks)
"""
import os
import sys
import time
import datetime as dt

import quandl
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
        self.df.reset_index(inplace=True)
        self.df.columns = [i.lower() for i in self.df.columns]
        if not self.required_columns.issubset(self.df.columns):
            raise ValueError('DataFrame should have OHLC {} columns'.format(self.required_columns))

    def uptrend_reversal(self, close):
        lows = [self.cdf.iloc[i]['low'] for i in range(-1, -self.LINE_NUMBER - 1, -1)]
        least = min(lows)
        return close < least

    def downtrend_reversal(self, close):
        highs = [self.cdf.iloc[i]['high'] for i in range(-1, -self.LINE_NUMBER - 1, -1)]
        highest = max(highs)
        return close > highest

    def get_bricks(self):
        if self.chart_type == self.PERIOD_CLOSE:
            self.period_close_bricks()
        else:
            self.price_movement_bricks()

        return self.cdf

    def period_close_bricks(self):
        brick_size = self.brick_size

        self.df = self.df[['date', 'open', 'high', 'low', 'close']]


        columns = ['date', 'open', 'high', 'low', 'close']

        self.cdf = pd.DataFrame(
            columns=columns,
            data=[],
        )

        self.cdf.loc[0] = self.df.loc[0]
        close = self.df.loc[0]['close'] // brick_size * brick_size

        # print(self.cdf.loc[0][1:], [close - brick_size, close, close - brick_size, close, True])
        self.cdf.loc[0, 1:] = [close - brick_size, close, close - brick_size, close]

        self.cdf['uptrend'] = True

        # print(brick_size, close)
        # print(self.cdf)
        # print('=')

        columns = ['date', 'open', 'high', 'low', 'close', 'uptrend']

        for index, row in self.df.iterrows():

            close = row['close']

            row_p1 = self.cdf.iloc[-1]

            uptrend = row_p1['uptrend']

            open_p1 = row_p1['open']
            high_p1 = row_p1['high']

            low_p1 = row_p1['low']
            close_p1 = row_p1['close']

            date = row['date']

            bricks = int((close - close_p1) / brick_size)

            data = []

            # print('========')
            print(date, uptrend, bricks, close, close_p1)

            if uptrend and bricks >= 1:
                for i in range(bricks):
                    r = [date, close_p1, close_p1 + brick_size, close_p1, close_p1 + brick_size, uptrend]
                    data.append(r)
                    close_p1 += brick_size
                t = 'uc'
            elif uptrend and bricks <= -2:
                uptrend = not uptrend
                bricks += 1
                close_p1 -= brick_size
                for i in range(abs(bricks)):
                    r = [date, close_p1, close_p1, close_p1 - brick_size, close_p1 - brick_size, uptrend]
                    data.append(r)
                    close_p1 -= brick_size
                t = 'ur'
            elif not uptrend and bricks <= -1:
                for i in range(abs(bricks)):
                    r = [date, close_p1, close_p1, close_p1 - brick_size, close_p1 - brick_size, uptrend]
                    data.append(r)
                    close_p1 -= brick_size
                t = 'dc'
            elif not uptrend and bricks >= 2:
                uptrend = not uptrend
                bricks -= 1
                close_p1 += brick_size
                for i in range(abs(bricks)):
                    r = [date, close_p1, close_p1 + brick_size, close_p1, close_p1 + brick_size, uptrend]
                    data.append(r)
                    close_p1 += brick_size
                t = 'dr'
            else:
                continue

            # print(data)
            print(date, t, bricks, bricks <= -2, uptrend, close, close_p1)

            sdf = pd.DataFrame(data=data, columns=columns)
            self.cdf = pd.concat([self.cdf, sdf])

        self.cdf.reset_index(inplace=True, drop=True)
        return self.cdf

    def shift_bricks(self):
        shift = self.df['close'].iloc[-1] - self.bdf['close'].iloc[-1]
        if abs(shift) < self.brick_size:
            return
        step = shift // self.brick_size
        self.bdf[['open', 'close']] += step * self.brick_size


if len(sys.argv) > 1:
    fname = sys.argv[1]
    print('Reading local file {}'.format(fname))
    df = pd.read_csv(sys.argv[1])
else:
    symbol='SBIN'
    # print('Downloading {} data from nsepy'.format(symbol))
    # df = nsepy.get_history(
    #     symbol=symbol,
    #     start=dt.date(2017,1,1),
    #     end=dt.date(2018,1,19)
    # )
    # if df.empty:
        # print('No data is received from nsepy.')
        # sys.exit()
    df = stock_df(symbol)

debug = True
df.reset_index(inplace=True)
df.columns = [i.lower() for i in df.columns]
print(df.tail(20))

renko = Renko(df)
renko.brick_size = 2
r = renko.get_bricks()
print(r.tail(20))
