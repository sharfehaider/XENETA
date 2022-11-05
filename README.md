# Xeneta Operations

## Tools: Absible, Docker, Docker-compose, Shell scripts 

### Pre-req:

Ansible must be installed on the system on which you will be running this code


Following are commands to install ansible

```bash
sudo apt-add-repository ppa:ansible/ansible

sudo apt update

sudo apt install ansible
```

#### Make sure that port 5432 and port 3000 are free to run database and API 

After cloning this repo simply run this command in root folder 

```bash
cd XENETA

sudo ansible-playbook docker-playbook.yml
``` 
### Test: 

```bash
curl "http://127.0.0.1:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL"
``` 

### Workfollow:

Both api and database are dockerized. They are connected in a docker file, where they are communicating with each other to produce the required results. 
This ansible playbook installs all the required configurations for this application to run. Database is running in the docker, it takes the dump from the folder when we build it while running the docker-compose. 
