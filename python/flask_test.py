import flask


app = flask.Flask(__name__)

app.testing = True

@app.route('/action', methods=['POST'])
def action():
    return 'x'

with app.test_client() as c:
    rv = c.post('http://domain.com/action?vodka=42', data={'gin': 43})
    rv = c.post('http://foobar.com/action?vodka=42', data={'gin': 43})
    rv = c.post('http://0.0.0.0:8000/foo', data={'gin': 43})
    print(rv.status_code, 200)
