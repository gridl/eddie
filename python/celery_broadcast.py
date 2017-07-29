import time

from celery import Celery
from kombu import Exchange, Queue, binding
from celery.schedules import crontab
from kombu.common import Broadcast
from kombu.common import Broadcast


app = Celery(broker='amqp://guest@localhost//', backend='rpc://')

app.conf.task_queues = (
    # Broadcast(name='bq', exchange=exchange),
    Broadcast(name='bq',),
)

# app.conf.CELERY_BEAT_SCHEDULE = {
#     'test-task': {
#         'task': 'tasks.reload_cache',
#         'schedule': crontab(minute=0, hour='*/3'),
#         'options': {'exchange': 'broadcast_tasks'}
#     },
# }

@app.task
def add(x, y):
    return x + y


@app.task
def foo(*args, **kwargs):
    print(args, kwargs)
