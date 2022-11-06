## Terraform for infra on AWS and deploying on EC2 server
Terraform scrip is written to create infrastructure on the AWS cloud and deploy the application on that infrastructure. For installation of terraform follow their official link.

## Installation

Click on [link](https://developer.hashicorp.com/terraform/cli/install/apt) to install terraform

Once you have installed the terraofrm, To provision the compute server (EC2 instance) we need to create a key pair to make ssh connection with the instance. Run the following command.

```bash
ssh-keygen  
```
(enter value “aws_key” in the first argument and leave everything else default)

```bash
chmod chmod 400 aws_key
```
Initialize the terraform by running the following command. 

```bash
terraform init
```
### Workspaces and Environments:
To handle different environments, different work-spaces will be created, in which we can create different environments using same configurations of code. 
All we have to do is to create a new workspace, and run the code. State file of each environment will be handled differently. 

```bash
terraform workspace new [env name]

terraform select [env name]
```


Provide argument values like access key and secret values of AWS account where we need to create the infrastructure and deploy the application
Now you will be working in that workspace where running the following command will create infrastructure and make the application running.
```bash
terraform apply 

terraform show | grep public_ip  ( to get the public ip )
```
Open this link on the terminal by replacing the public ip address retrieved from the above command.


```bash
http://<public_ip>:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL
```
To ssh into the instance run the follwoung command.

```bash
ssh -i "aws_key" ubuntu@ec2-<public_ip “-”seprated>.us-east-2.compute.amazonaws.com 
```

Ip-address - separates 1-2-3-4

Once ssh will be done then on terminal one can run the following command to get the desired output

 ```bash
curl "http://127.0.0.1:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL"
```
