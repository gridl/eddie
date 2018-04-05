import threading
import pandas as pd
import numpy as np


def let_crash(crash=True):
    t = 0.02 * np.arange(100000) # ok con 10000
    data = pd.DataFrame({'t': t})
    if crash:
        data['t'] * 1.5  # CRASH
    else:
        data['t'].values * 1.5  # THIS IS OK!


if __name__ == '__main__':
        threads = []
        for i in range(100):
            if True:  # asynchronous
                t = threading.Thread(target=let_crash, args = ())
                t.daemon = True
                t.start()
                threads.append(t)
            else:  # synchronous
                let_crash()
        for t in threads:
            t.join()
