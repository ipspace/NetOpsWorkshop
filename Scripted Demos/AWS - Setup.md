# AWS VPC demo

aws ec2 describe-security-groups
aws ec2 authorize-security-group-ingress --group-name default --protocol tcp --port 22 --cidr 0.0.0.0/0