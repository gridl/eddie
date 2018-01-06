import os

from alpha_vantage.timeseries import TimeSeries, TimeSeriesDaily
from alpha_vantage.techindicators import TechIndicators


key = os.environ.get('ALPHAVANTAGE_KEY')
print(key)

ts = TimeSeries(key=key)


import matplotlib.pyplot as plt

symbol = 'MSFT'
symbol = 'NSE:RELIANCE'

ti = TechIndicators(key=key, output_format='pandas')
data, meta_data = ti.get_bbands(symbol=symbol, interval='60min', time_period=60)
data.plot()
plt.title('BBbands indicator for  MSFT stock (60 min)')
plt.show()


print(meta_data)
