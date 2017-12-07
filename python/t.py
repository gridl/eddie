from celery import Celery

broker = 'amqp://guest:guest@localhost//'
broker = 'sqla+postgresql://f:f@localhost/f'


app = Celery(broker=broker)

app.conf.update({
    'CELERYD_LOG_COLOR': False,
})


@app.task
def add(x, y):
    return x + y
