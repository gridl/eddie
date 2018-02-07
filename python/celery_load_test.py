import sys
import timeit

from celery import Celery
from kombu.serialization import register

broker = 'memory://'
broker = 'amqp://guest:guest@localhost//'
broker = 'sqla+postgresql://f:f@localhost/f'

app = Celery(broker=broker)

app.conf.update({
    'CELERYD_LOG_COLOR': False,
})


@app.task
def add(x, y):
    return x + y


@app.task
def dummy():
    pass


try:
    count = int(sys.argv[1])
except:
    count = 1000

print(count)


start_time = timeit.default_timer()
# [dummy.delay() for i in range(count)]
[add.delay(1, 2) for i in range(count)]
print(timeit.default_timer() - start_time)
