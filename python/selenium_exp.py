import random
import time
import asyncio
import threading
from concurrent import futures

from selenium.webdriver import Firefox
from selenium.webdriver.firefox.options import Options


options = Options()
options.set_headless()
# options.add_arguments("--disable-notifications")


debug = True

duration = 4


url = 'https://telugu.pratilipi.com/read?id=6755373518909383'

# proverbs
url = 'https://telugu.pratilipi.com/read?id=6755373518926758'


def read_url(url):
    driver = Firefox(options=options)
    driver.maximize_window()
    driver.get(url)
    time.sleep(4)
    height = driver.execute_script("return document.body.scrollHeight")
    print(height)

    position = 0

    while position < height:
        driver.execute_script(f"window.scrollTo(0, {position});")
        delta = random.randint(50, 500)
        position += delta
        duration = delta // 20
        # print(height, position, delta, duration)
        time.sleep(duration)

    driver.close()


# loop = asyncio.get_event_loop()
# loop.run_until_complete(asyncio.wait([rea(url) for i in range(4)]))


# threads = []
# for i in range(4):
#     t = threading.Thread(target=read_url, args=(url,))
#     t.daemon = True
#     t.start()
#     threads.append(t)

# for thread in threads:
#     thread.join()

workers = 2
urls = [url] * 4


while True:
    with futures.ThreadPoolExecutor(max_workers=workers) as executor:
        result = executor.map(read_url, urls)
