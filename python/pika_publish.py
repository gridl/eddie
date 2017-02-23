import time
import random

import pika


connection = pika.BlockingConnection(pika.ConnectionParameters(host='localhost'))
channel = connection.channel()


queues = ['queue1', 'queue2']
messages = ['foo', 'bar']


while True:
    queue = random.choice(queues)
    message = random.choice(messages)

    channel.queue_declare(queue=queue)
    channel.basic_publish(
        exchange='', routing_key=queue, body=message)
    print("{}:{}".format(queue, message))
    time.sleep(2)

connection.close()
