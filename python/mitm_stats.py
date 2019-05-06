#! /usr/bin/python3
import sys
from collections import Counter
from pprint import pprint

from mitmproxy.io import FlowReader


filename = sys.argv[1]

urls = []
domains = []

with open(filename, 'rb') as fp:
    reader = FlowReader(fp)

    for flow in reader.stream():
        try:
            url = flow.request.url
            domain = url.split('//')[-1].split('/')[0]
            domains.append(domain)
            urls.append(url)
        except:
            # print(dir(flow))
            pass



def stats(items):
    counter = Counter(items)
    pprint(counter.most_common(50))


stats(urls)
stats(domains)


