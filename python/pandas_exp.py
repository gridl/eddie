# pandas
import pandas as pd


df = pd.DataFrame([['a', 2], ['c', 4], ['b', 5]], columns=['x', 'y'])


# iterrows is a generator which yield both index and row
for index, row in df.iterrows():
    print(row['c1'], row['c2'])


# plot pie chart
# get_ipython().magic('matplotlib inline')
df['y'].plot(kind='pie', title='Population distribution',
             figsize=[8, 8], fontsize=10,
             labels=df['x'], label='Cities',
             autopct='%1.1f%%')



# on spot averages
df = pd.DataFrame(
    data=[['a', 2], ['a', 4], ['b', 5]],
    columns=['x', 'y']
)
print(df)
df.groupby('x')['y'].mean()


# read from csv files
d1 = pd.read_csv('./exercise/c1.csv')
d2 = pd.read_csv('./exercise/c2.csv', skiprows=2)
d2 = pd.read_csv('./exercise/c2.csv', encoding='utf-8')

# write to csv
df.to_csv('foo.csv')
df.to_csv('foo.csv', index=False)


d3 = d2.groupby(['chr', 'pos', 'ref', 'alt']).size()
print(type(d3))
print(d3)
print(d3.columns)


# start index from 1
df.index += 1


# get 2nd row
df.iloc[1]

# get 3 & 7 rows
df.iloc[[2, 6]]


# get row labelled 3
df.loc[3]
