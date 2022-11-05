#!/bin/bash
yes Y | sudo apt-add-repository ppa:ansible/ansible
sudo apt update 
yes Y | sudo apt install ansible
git clone https://github.com/sharfehaider/XENETA.git
cd XENETA
ansible-playbook docker-playbook.yml