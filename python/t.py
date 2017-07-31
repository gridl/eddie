import random

from celery import Celery, Task


app = Celery(broker='amqp://guest@localhost//', backend='rpc://')


class ReadyTask(Task):

    def run(self, user):
        try:
            print(user)
        except Exception as exc:
            pass

    def on_failure(self, exc, task_id, *args, **kwargs):
        print(args, kwargs)
