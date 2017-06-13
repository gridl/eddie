import time

from celery import Celery

app = Celery(
    'tasks',
    broker='amqp://guest@localhost//',
    backend='rpc://',
    task_serializer='json',
    result_serializer='json',
    accept_content=['application/json'],
)

# app = Celery(broker='amqp://guest@localhost//', backend='rpc')
# app = Celery(broker='redis://localhost:6379/0')
from kombu.common import Broadcast
from kombu import Exchange, Queue, binding

exchange = Exchange('custom_exchange', type='fanout')
# exchange = Exchange('custom_exchange', type='direct')


app.conf.update({
    #     'CELERY_SEND_EVENTS': False
    # 'CELERYD_LOG_COLOR': False,
    # 'CELERY_TASK_SERIALIZER': 'json',
    # 'CELERY_QUEUES': (Broadcast('bq', exchange=exchange),),
    # 'CELERY_QUEUES': (Queue('foo'), Queue('bar')),
    # 'CELERY_ROUTES': {
    #     't.add': {'queue': 'bq'}
    # },
})

from kombu.common import Broadcast
from celery.schedules import crontab

app.conf.task_queues = (
    Broadcast(name='broadcast_tasks', exchange=exchange),
)

# app.conf.task_queues = (Broadcast('broadcast_tasks'),)
# app.conf.task_queues = (Queue('foo'), Queue('bar'))

# app.conf.CELERY_BEAT_SCHEDULE = {
#     'test-task': {
#         'task': 'tasks.reload_cache',
#         'schedule': crontab(minute=0, hour='*/3'),
#         'options': {'exchange': 'broadcast_tasks'}
#     },
# }

CELERY_ACCEPT_CONTENT = ['myjson']
CELERY_RESULT_SERIALIZER = 'myjson'

# app.conf.result_expires = 3600

# from celery.contrib import rdb; rdb.set_trace();

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
