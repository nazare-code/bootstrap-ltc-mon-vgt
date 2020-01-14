#!/bin/bash

# Update hosts file
echo "[TASK 1] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.1.241 node1.example.com ui.example.com ui
192.168.1.242 node2.example.com getter.example.com getter
192.168.1.243 node3.example.com queue.example.com queue
EOF

#install docker engine
echo "[TASK 2] Install docker engine"
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y >/dev/null 2>&1
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - >/dev/null 2>&1
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable" >/dev/null 2>&1
sudo apt-get update >/dev/null 2>&1
sudo apt-get install docker-ce -y >/dev/null 2>&1
sudo systemctl enable docker >/dev/null 2>&1
sudo usermod -aG docker vagrant

#install docker-compose 
echo "[TASK 3] Install docker-compose"
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose >/dev/null 2>&1
sudo chmod +x /usr/local/bin/docker-compose >/dev/null 2>&1
