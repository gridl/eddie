from celery import Celery

app = Celery(
    'tasks',
    broker='pyamqp://guest@localhost//',
    backend='rpc://',
)


@app.task
def prime(number):
    for i in range(2, number):
        if (number % i) == 0:
            return False
    return True
