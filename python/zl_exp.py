import pandas as pd
from collections import OrderedDict
import pytz
from collections import OrderedDict

from pandas_datareader import data, wb
from pandas_datareader import data as d

data = OrderedDict()

start_date = '1/1/2017'
end_date = '1/1/2018'

data['SPY'] = d('SPY',data_source='google',start=start_date, end=end_date)

start_date = '9/17/2011'
end_date = '6/24/2015'
data['SPY'] = DataReader('SPY',data_source='google',start=start_date, end=end_date)
print(data['SPY'].head())
type(data['SPY'])


datas = OrderedDict()

data['SPY'] = pd.read_csv('~/.stocks/edelweiss/RELIANCE', index_col=0, parse_dates=['date'])
print(data['SPY'].head())
