import asyncio
import datetime
import random

import websockets


async def echo(websocket, path):
    async for message in websocket:
        await websocket.send(message)


async def time(websocket, path):
    cid = random.randint(1, 100)
    while True:
        now = datetime.datetime.utcnow().isoformat() + 'Z'
        msg = f'{cid} {now}'
        print(msg)
        await websocket.send(msg)
        await asyncio.sleep(random.random() * 3)


host = '0.0.0.0'
port = 8000
func = time

print(func, host, port)

asyncio.get_event_loop().run_until_complete(
    websockets.serve(func, host, port)
)
asyncio.get_event_loop().run_forever()
