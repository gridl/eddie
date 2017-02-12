import os

import boto3
import botocore.exceptions


ak = os.environ.get('AWS_ACCESS_KEY_ID')
sk = os.environ.get('AWS_SECRET_ACCESS_KEY')


host = 'http://localhost:9000'


session = boto3.session.Session()

s3_client = session.client(
    service_name='s3',
    aws_access_key_id=ak,
    aws_secret_access_key=sk,
    endpoint_url=host,
)

s3 = boto3.resource(
    service_name='s3',
    aws_access_key_id=ak,
    aws_secret_access_key=sk,
    endpoint_url=host,
)

client = s3_client

bucket = 'test'


try:
    client.head_bucket(Bucket=bucket)
except botocore.exceptions.ClientError:
    client.create_bucket(Bucket=bucket)

r = client.list_buckets()
buckets = [b['Name'] for b in r['Buckets']]
print(buckets)

filename = key = 'test.txt'
client.upload_file(Filename='test.txt', Bucket=bucket, Key=key)
client.download_file(bucket, key, 'foo.txt')


policy = client.get_bucket_policy(Bucket=buckets[0])
# print(policy)


# Connect to EC2
# ec2 = boto3.resource('ec2')

# # Get information for all running instances
# running_instances = ec2.instances.filter(Filters=[{
#     'Name': 'instance-state-name',
#     'Values': ['running']}])
