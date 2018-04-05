from celery import Celery

app = Celery(
    'tasks',
    broker='redis://celery-redis:6379//0',
    backend='redis://celery-redis:6379//0',
    # send_task_event=True,
)
app.conf.update({
    'CELERYD_LOG_COLOR': False,
    'CELERY_SEND_TASK_SENT_EVENT': True,
    'CELERY_SEND_EVENTS': True,
})


@app.task
def add(a, b):
    return a + b
