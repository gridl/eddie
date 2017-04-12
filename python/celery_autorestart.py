import subprocess


def restart_celery():
    pid = None
    if pid:
    cmd = 'pgrep celery | xargs kill -9'
    subprocess.call(cmd, shell=True,
                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    cmd = 'pgrep celery | xargs kill -9'
    subprocess.call(cmd, shell=True,
                    stdout=subprocess.PIPE, stderr=subprocess.STDOUT)



autoreload.main(restart_celery)
