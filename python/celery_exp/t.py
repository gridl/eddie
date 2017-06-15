import time

from celery import Celery, Task, current_app, current_task, shared_task
from kombu import Exchange, Queue, binding
from celery.schedules import crontab
from kombu.common import Broadcast


app = Celery(
    'tasks',
    broker='amqp://guest@localhost//',
    backend='rpc://',
    task_serializer='json',
    result_serializer='json',
    accept_content=['application/json'],
)

# app = Celery(broker='amqp://guest@localhost//', backend='rpc')
app = Celery(broker='redis://localhost:6379/0')

app.conf.update({
    'CELERYD_LOG_COLOR': False,
})


@app.task
def add(x, y):
    return x + y


@app.task
def wait(seconds):
    print('started')
    time.sleep(seconds)
    print('done')


@app.task
def foo(*args, **kwargs):
    print(args, kwargs)
