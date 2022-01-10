# Script to teardown backend

Write-Host "starting backend termination"

$inicontent = Get-IniContent backend.ini

$backend = $inicontent["backend"]

Write-Host "deleting key submission queue"
aws sqs delete-queue --queue-url $backend["queueurl"]

Write-Host "terminating instance"
aws ec2 terminate-instances --instance-ids $backend["instanceid"]

Write-Host "waiting until instance terminated..."
aws ec2 wait instance-terminated --instance-ids $backend["instanceid"]

Write-Host "deleting subnet"
aws ec2 delete-subnet --subnet-id $backend["subnetid"]

Write-Host "detaching internet gateway"
aws ec2 detach-internet-gateway --internet-gateway-id $backend["gatewayid"] --vpc-id $backend["vpcid"]

Write-Host "deleting internet gateway"
aws ec2 delete-internet-gateway --internet-gateway-id $backend["gatewayid"]

Write-Host "deleting route table"
aws ec2 delete-route-table --route-table-id $backend["routetableid"]

Write-Host "deleting security group"
aws ec2 delete-security-group --group-id $backend["securitygroupid"]

Write-Host "deleting VPC"
aws ec2 delete-vpc --vpc-id $backend["vpcid"]

Write-Host "backend termination complete"

