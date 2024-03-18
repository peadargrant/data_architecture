# MongoDB lab

1. Make sure you have an ED25519 key named LAB_KEY in your AWS account.
2. Create a CloudFormation stack from the `documentdb_template.yaml` file.
3. Login as ec2-user to the EC2 instance IP address.
4. Update software using: `sudo yum -y update`
5. Check if mongodb appears in search results for `yum search mongodb`. 
6. Put contents of `mongodb.repo` into `/etc/yum.repos.d/mongo.repo`.
7. Confirm that searching for mongodb using `yum search` returns results.
8. Use yum to install mongodb as `sudo yum -y install mongodb-org`.
9. Enable `mongod` service using `sudo systemctl enable mongod`.
10. Start the `mongod` service using `sudo systemctl start mongod`.
11. Confirm using `systemctl status mongod` that mongod is running.
12. Try to connect using `mongosh`.
13. Use the command in the startup banner to suppress the cloud message.

