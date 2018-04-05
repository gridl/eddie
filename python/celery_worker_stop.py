import time

from celery import Celery
from celery.signals import task_postrun
from celery.exceptions import WorkerShutdown


broker = 'sqla+postgresql://f:f@localhost/f'
broker = 'amqp://guest:guest@localhost//'
broker = 'redis://user@localhost:6379/0'
broker = 'memory://'
broker = 'redis://localhost:6379/0'


app = Celery('tasks', broker=broker)
app = Celery(broker=broker)
app = Celery('tasks', broker=broker, backend=broker)


app.conf.update({
    'CELERYD_LOG_COLOR': False,
})


@app.task
def add(x, y):
    return x + y


@app.task
def dummy():
    pass


@app.task
def slow(seconds):
    time.sleep(seconds)
    return seconds


@task_postrun.connect(sender=add)
def shutdown(*args, **kwargs):
    app.control.broadcast('shutdown', destination=['foo@worker'])
    app.control.broadcast('shutdown')
    print("a")
    # raise WorkerShutdown()
