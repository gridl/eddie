import ssl
import socket
import pickle
import os


hostname = 'avilpage.com'


def get_certificate(host):
    ctx = ssl.create_default_context()
    s = ctx.wrap_socket(socket.socket(), server_hostname=hostname)
    s.connect((hostname, 443))
    cert = s.getpeercert()
    return cert


filename = 'domains.csv'
pickle_file = 'domains.pkl'


if not os.path.exists(pickle_file):
    data = {}
    with open(pickle_file, 'wb') as fh:
        pickle.dump(data, fh)


with open(pickle_file, 'rb') as fh:
    data = pickle.load(fh)


with open(filename) as fh:
    for index, line in enumerate(fh):
        domain = line.split(',')[1]
        if domain in data:
            continue
        print(line)
        certificate = get_certificate(domain)
        data[domain] = certificate

        if index % 10 == 0:
            with open(pickle_file, 'wb') as fh:
                pickle.dump(data, fh)
