import time

from celery import Celery

app = Celery(
    broker='amqp://guest@localhost//',
    backend='amqp://',
    task_serializer='json',
    result_serializer='json',
    accept_content = ['application/json']
)

# app = Celery(broker='amqp://guest@localhost//', backend='rpc')
# app = Celery(broker='redis://localhost:6379/0')

app.conf.update({
#     'CELERY_SEND_EVENTS': False
    'CELERYD_LOG_COLOR': False,
    'CELERY_TASK_SERIALIZER': 'json'
})
CELERY_ACCEPT_CONTENT = ['myjson']
CELERY_RESULT_SERIALIZER = 'myjson'

# app.conf.result_expires = 3600


@app.task
def add(x, y):
    return x + y


@app.task
def sub(x, y):
    return x - y


@app.task
def mul(x, y):
    return x * y


@app.task
def wait(seconds):
    print('started')
    time.sleep(seconds)
    print('done')


@app.task
def dummy():
    pass


@app.task
def foo(*args, **kwargs):
    print(args, kwargs)


@app.task
def bar(*args, **kwargs):
    print(args, kwargs)


@app.task
def baz(*args, **kwargs):
    print(args, kwargs)
