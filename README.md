# Xeneta Operations
Ansible must be installed on the system on which you will be running this code
Mkae sure that port 5432 and port 3000 are free to run database and API 
simply run this command in root folder 
andible-playbook docker-playbook.yml

curl "http://127.0.0.1:3000/rates?date_from=2021-01-01&date_to=2021-01-31&orig_code=CNGGZ&dest_code=EETLL"
