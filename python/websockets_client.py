import sys
import asyncio

import websockets


async def read(uri):
    print(uri)
    async with websockets.connect(uri) as websocket:
        while True:
            data = await websocket.recv()
            print(f"< {data}")
            print()


debug = len(sys.argv) > 1
turi = 'ws://0.0.0.0:8000/'
uris = [turi] * 2
print(uris)

asyncio.get_event_loop().run_until_complete(
    asyncio.wait([read(uri) for uri in uris])
)
