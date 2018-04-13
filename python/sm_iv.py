import pandas as pd
import numpy as np
import arch

import sys


filename = 't.csv'
if len(sys.argv) > 1:
    filename = sys.argv[1]

df = pd.read_csv(filename)

df.columns = [i.lower() for i in df.columns]

df = df[['close']]
df['log_price'] = np.log(df['close'])
df['pct_change'] = df['log_price'].diff()

df['stdev21'] = df['pct_change'].rolling(window=21, center=False).std()
df['hvol21'] = df['stdev21'] * (252**0.5) # Annualize.
df['variance'] = df['hvol21']**2
df = df.dropna()

returns = df['pct_change'] * 100
am = arch.arch_model(returns)

res = am.fit(disp='off')
print(res.summary())

df['forecast_vol'] = 0.1 * np.sqrt(res.params['omega'] + res.params['alpha[1]'] * res.resid**2 + res.conditional_volatility**2 * res.params['beta[1]'])

print(df.tail(20))
