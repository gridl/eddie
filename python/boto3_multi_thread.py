import threading
import datetime as dt
import os

import boto3
import botocore.exceptions

aws_access_key_id = os.environ.get('AWS_ACCESS_KEY_ID')
aws_secret_access_key = os.environ.get('AWS_SECRET_ACCESS_KEY')
print(aws_access_key_id, aws_secret_access_key)

aws_access_key_id = 'AKIAIUIOHPYGFC3XRMIA'
aws_secret_access_key = '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'





def upload_file():
    bucket_name = 'cura-test-bucket'

    session = boto3.session.Session()
    s3_client = session.client(
        service_name='s3',
        aws_access_key_id=aws_access_key_id,
        aws_secret_access_key=aws_secret_access_key,
    )


    filename = key = 'test.txt'
    s3_client.upload_file(Filename='test.txt', Bucket=bucket_name, Key=key)
    s3_client.download_file(bucket_name, key, 'foo.txt')


threads = []

for i in range(4):
    t = threading.Thread(target=upload_file)
    t.start()
    threads.append(t)

for thread in threads:
    t.join()
