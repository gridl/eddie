from celery import Celery, group, chord


# app = Celery(broker='amqp://guest@localhost//', backend='amqp://')
app = Celery(broker='amqp://guest@localhost//', backend='rpc')
app.conf.update({
    'CELERY_SEND_EVENTS': False
})


@app.task
def add(x, y):
    return x + y
