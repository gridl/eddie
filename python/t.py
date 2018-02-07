from celery import Celery


broker = 'amqp://guest:guest@localhost//'
broker = 'memory://'
broker = 'sqla+postgresql://f:f@localhost/f'


from kombu.serialization import register


def loads(s):
    return s

def dumps(s):
    return s

register(
    'mem_serializer', dumps, loads,
    content_type='application/x-memory',
    content_encoding='binary',
    # content_encoding='utf-8',
)


serializer = 'mem_serializer'

app = Celery(broker=broker)

app.conf.update({
    'CELERYD_LOG_COLOR': False,
    # 'CELERY_ACCEPT_CONTENT': [serializer],
    # 'CELERY_TASK_SERIALIZER': serializer,
    # 'CELERY_RESULT_SERIALIZER': serializer,
})


@app.task
def add(x, y):
    return x + y


@app.task
def dummy():
    pass
