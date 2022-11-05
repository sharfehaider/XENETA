# XENETA

ssh-keygen                 (enter value “aws_key” in the first argument and leave everything else default)
terraform workspace new [env name]
terraform select [env name]
terraform apply 	         ( provide argument values like access key and secret values of aws account where we need to create the infrastructure and deploy the application )
terraform show | grep public_ip  ( to get the public ip )


http://<public_ip>:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL

ssh -i "aws_key" ubuntu@ec2-<public_ip “-”seprated>.us-east-2.compute.amazonaws.com 
Ip-address - separates 1-2-3-4

