import os

import requests


url = 'http://www.ssckkr.kar.nic.in/'
file_name = 'index.html'

response = requests.get(url)

data = response.text.strip()

if not os.path.exists(file_name):
    with open(file_name, 'w') as fh:
        fh.write(data)

cache = open(file_name).read().strip()
index = data.find('1.\'"CLICK')
d_slice = slice(index, index + 50)

if cache[d_slice] != data[d_slice]:
    print('website changed')
