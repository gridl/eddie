from pyrabbit.api import Client

client = Client('http://localhost:55672', 'guest', 'guest')
client = Client('localhost:15672', 'guest', 'guest')
print(client.is_alive())
messages = client.get_messages('/', 'celery')
print(messages)
