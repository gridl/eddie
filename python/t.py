from celery import Celery

# app = Celery(broker='amqp://guest@localhost//', backend='amqp://')
app = Celery(broker='amqp://guest@localhost//', backend='rpc')

# app.conf.update({
#     'CELERY_SEND_EVENTS': False
# })


@app.task
def add(x, y):
    import time; time.sleep(30)
    return x + y


@app.task
def sub(x, y):
    import time; time.sleep(30)

    return x - y


@app.task
def mul(x, y):
    import time; time.sleep(30)

    return x * y
