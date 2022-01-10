# script to setup lab backend for SSH lab
# Peadar Grant

# check for key pair existence
$KeyPair="LAB_KEY"
$KeyPairs=(aws ec2 describe-key-pairs --filters Name=key-name,Values=$KeyPair | ConvertFrom-Json).KeyPairs
if ( $KeyPairs.Count -ne 1 ) {
   throw "must be exactly 1 key pair named $KeyPair (found $($KeyPairs.Count))."
}
Write-Host "KeyPair: $($KeyPairs[0].KeyPairId)"

# VPCs
$Vpcs=(aws ec2 describe-vpcs --filter Name=tag:Name,Values=MSCDA_LAB_VPC | ConvertFrom-Json).Vpcs
if ( $Vpcs.Count -ge 1 ) {
    throw "found $($Vpcs.Count) VPCs named MSCDA_LAB_VPC - rename/delete"
}
$Vpc = (aws ec2 create-vpc --cidr-block 10.0.0.0/16 | ConvertFrom-Json ).Vpc
Write-Host "VPC: $($Vpc.VpcId)"
aws ec2 create-tags --resources $Vpc.VpcId --tags Key=Name,Value=MSCDA_LAB_VPC

# Subnet 
$Subnet = (aws ec2 create-subnet --vpc-id $Vpc.VpcId --cidr-block 10.0.1.0/24 | ConvertFrom-Json).Subnet
Write-Host "Subnet: $($Subnet.SubnetId)"
aws ec2 create-tags --resources $Subnet.SubnetId --tags Key=Name,Value=MSCDA_LAB_1_SN

# turn on auto assign public IP
aws ec2 modify-subnet-attribute --subnet-id $Subnet.SubnetId --map-public-ip-on-launch

# internet gateway creation
$IGW = (aws ec2 create-internet-gateway | ConvertFrom-Json).InternetGateway
Write-Host "IGW: $($IGW.InternetGatewayId)"
aws ec2 create-tags --resources $IGW.InternetGatewayId --tags Key=Name,Value=MSCDA_LAB_IGW
aws ec2 attach-internet-gateway --vpc-id $Vpc.VpcId --internet-gateway-id $IGW.InternetGatewayId

# route table
$RT = (aws ec2 describe-route-tables --filters Name=vpc-id,Values=$($Vpc.VpcId) | ConvertFrom-Json).RouteTables[0]
Write-Host "Route Table: $($RT.RouteTableId)"
aws ec2 create-tags --resources $RT.RouteTableId --tags Key=Name,Value=MSCDA_LAB_RTB
aws ec2 create-route --route-table-id $RT.RouteTableId --gateway-id $IGW.InternetGatewayId --destination-cidr-block 0.0.0.0/0

# security group
$SGId=(aws ec2 create-security-group --group-name 'MSCDA_LAB_SG' --description 'SSH Lab security group' --vpc-id $Vpc.VpcId | ConvertFrom-Json).GroupId
Write-Host "Security Group: $($SGId)"
aws ec2 authorize-security-group-ingress --group-id $SGId --protocol tcp --port 22 --cidr 0.0.0.0/0
Write-Host "Modified security group to permit SSH access"

# EC2 instance (amazon linux, t2.nano)
$InstanceId=(aws ec2 run-instances --subnet-id $($Subnet.SubnetId) --instance-type t2.micro --key-name LAB_KEY --security-group-ids $SGId --image-id resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --user-data file://backend_userdata.sh | ConvertFrom-Json).Instances.InstanceId
Write-Host "instance ID: $InstanceId"

# Get public IP address
$InstanceInfo = (aws ec2 describe-instances --instance-id $InstanceId | ConvertFrom-Json)
$PublicIpAddress = $InstanceInfo.Reservations.Instances[0].PublicIpAddress
Write-Host "public IP address is: $PublicIpAddress"

# INI data for teardown
$inidata = @{ "backend"=  @{ "instanceid" = $InstanceId ; "publicipaddress" = $PublicIpAddress ; "vpcid" = $Vpc.VpcId ; "subnetid" = $Subnet.SubnetId ; "gatewayid" = $IGW.InternetGatewayId ; "routetableid" = $RT.RouteTableId ; "securitygroupid" = $SGId }  }
$inidata | Out-IniFile -FilePath backend.ini -Force

