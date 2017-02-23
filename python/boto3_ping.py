import boto.ec2
conn = boto.ec2.connect_to_region("us-east-1")
statuses = conn.get_all_instance_status()
print(statuses)
