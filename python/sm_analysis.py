import collections
import os
import time
import sys

import pandas as pd
import stocktrends as st

sys.path.append(os.path.expanduser('~/Dropbox/tech/'))
import sm_data

symbol = 'reliance'

symbols = ['fconsumer']
symbols = st.indices.NIFTY50

cache = True
nse = 2


for symbol in symbols:
    print('---------------------')
    print(symbol)

    df = sm_data.get_stock_df(symbol, cache=cache, provider=nse)

    print(df.head())
    brick_size = 1.89
