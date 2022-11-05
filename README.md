# XENETA
Terraform scrip is written to create infrasture on the aws cloud and deploy the application on that infrastructre. For installation of terraform follow their official link. 

https://developer.hashicorp.com/terraform/cli/install/apt

Once you have installed the terraofrm, To provision the compute server (EC2 instance) we need to create a key pair to make ssh connection with the instance. 

To handle different environments, different workspaces will be created, in which we can create different environemnts using same confugrations of code. 
All we have to do is to create a new workspace, and run the code. State file of each environment will be handled differfently. 

Once the command terraform apply will execute, It will ask for four parameters on the terminal, aws access key, aws secret key, aws region and environment. 
After that infrastructure will be created and appliacation will be deployed on that server. 

Run the follwoing commands. 

ssh-keygen                 (enter value “aws_key” in the first argument and leave everything else default)

chmod chmod 400 aws_key    (to give permissions to the aws key)

terraform init

terraform workspace new [env name]

terraform select [env name]

terraform apply 	         ( provide argument values like access key and secret values of aws account where we need to create the infrastructure and deploy the application )

terraform show | grep public_ip  ( to get the public ip )

Open this link on the terminal by replacing the publi ip address retrived from the above command

http://<public_ip>:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL

To ssh into the instance run the follwoung command. 

ssh -i "aws_key" ubuntu@ec2-<public_ip “-”seprated>.us-east-2.compute.amazonaws.com 

Ip-address - separates 1-2-3-4

