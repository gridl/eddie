import collections
import os
import time
import datetime as dt
from os.path import join
import warnings

import pandas as pd
from nsepy import get_history
import techind
import sm_kite
import stockstats
from stockstats import StockDataFrame
import prettytable


warnings.simplefilter(action='ignore', category=FutureWarning)

close = 'close'
avg = 'average'
ma = 'moving_average'

now = dt.datetime.now()
today = now.date()
# start_date = date(2016, 1, 1)
start_date = today - dt.timedelta(3650)

print()

stocks_dir = os.path.expanduser('~/.stocks')
renko = 'RENKO'


def atr_status(df):
    # df = techind.ATR(df, 7)
    df = StockDataFrame.retype(df)
    _ = df['close_21_ema']
    _ = df['atr_7']

    df['atr_sl'] = df['close_21_ema'] - df['atr_7'] * 3
    df['atr_sl_status'] = df['close'] > df['atr_sl']
    # df.drop(['open', 'high', 'low', 'close', 'volume'], axis=1, inplace=True)
    # df = df.reset_index()
    # df.drop(['date', 'open', 'high', 'low', 'volume'], axis=1, inplace=True)
    return df
    # print(df.tail(1))
    # print(df['atr_sl_status'][-1])



def renko_status(df):
    df['diff'] = df[close] - df[close].shift(1)
    df = df.dropna()
    df['bricks'] = df.loc[:, ('diff', )] / brick_size
    df.loc[:, ('bricks', )] = df['bricks'].astype(int)
    df = df[df['bricks'] != 0]

    column = 'bricks'
    bricks = df[column]
    grouper = (bricks != bricks.shift()).cumsum()
    df['rcsum'] = df.groupby(grouper)[column].cumsum()
    df['rdiff'] = df[column].diff()

    return df

symbols = ['acc', 'reliance', 'jvlagro']
symbols = ['reliance', 'icicibank', 'jetairways']
symbols = ['reliance', 'nifty50', ]
cache = True
# cache = False

columns = ('symbol', 'close', 'buy_status', 'renko_score', 'brick_size', )
table = prettytable.PrettyTable(columns)


for symbol in symbols:
    df = sm_kite.get_kite_df(symbol, cache=cache)
    # print(df.columns)
    # print(df[close][-5:])
    # print(df.head())

    df = atr_status(df)

    brick_size = 1.89
    brick_size = df['atr_7'][-1]
    df = renko_status(df)
    rscore = df['rcsum'][df['rdiff'].shift(-1) != 0]

    buy_status = df['atr_sl_status'][-1]

    # print(df[close][-5:])
    # print(df.tail(25))
    data = (symbol, df[close][-1], buy_status, rscore[-8:], brick_size)
    table.add_row(data)


print(table)
# print(df['bricks'])
