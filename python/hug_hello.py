import hug


@hug.get('/hello')
def hello(request, response):
    print(request.params)
    return'hello'


if __name__ == '__main__':
    hello.interface.api()
