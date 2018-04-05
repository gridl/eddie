def fibonacci(n):
    old = 0
    cur = 1

    i = 1

    yield old

    while(i < n):
        cur, old, i = cur + old, cur, i + 1
        yield old


print([i for i in fibonacci(10)])
