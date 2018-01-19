import collections
import os
import time
import datetime as dt
from os.path import join
import warnings
import sys

import pandas as pd
import techind
import sm_kite
import stockstats
from stockstats import StockDataFrame
import prettytable
import numpy as np


warnings.simplefilter(action='ignore', category=FutureWarning)


def renko_status(df):
    df['cdiff'] = df['Close'] - df['Close'].shift(1)
    df = df.dropna()
    df['bricks'] = df.loc[:, ('cdiff', )] / brick_size
    df.loc[:, ('bricks', )] = df['bricks'].astype(int)
    # df = df[df['bricks'] != 0]

    column = 'bricks'
    bricks = df[column]
    grouper = (bricks != bricks.shift()).cumsum()
    df['rcsum'] = df.groupby(grouper)[column].cumsum()
    df['rdiff'] = df[column].diff()

    return df


try:
    df = pd.read_csv(sys.argv[1])
except:
    df = pd.read_csv('data.csv')


df.set_index('Date', inplace=True)
df.sort_index(ascending=True, inplace=True)

brick_size = 7.75
print(brick_size)
print('================')
df = renko_status(df)

# rscore = df['rcsum'][df['rdiff'].shift(-1) != 0]
# bricks = df[df['bricks'] != 0]['bricks'].values

print(df.tail())
