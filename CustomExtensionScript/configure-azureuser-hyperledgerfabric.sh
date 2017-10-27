#!/bin/bash
#Verify if git is installed
echo git --version
#Set User Path
cd /home/azureuser
#Create a work directory to host the source code
mkdir work
#Install GO
echo "---------------Installing GO------------------"
apt-get update
apt-get -y upgrade
curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
tar -xzf go1.9.1.linux-amd64.tar.gz
echo "--------------GO Installed--------------------"
#Install Node 6.x and NPM
echo "------------Installing Node.js----------------"
curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
bash nodesource_setup.sh
apt-get install -y nodejs 
apt-get install -y build-essential
npm install npm@3.10.10 -g
echo "--------Node.js Installation Completed--------"

#Install Docker and Docker Compose
echo "-----Installing Docker and Docker Compose-----"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg |  apt-key add 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
apt install -y docker-compose
echo "--Docker & Docker Compose Installation Completed--"

#Setup Hyperledger Components
curl -sSL https://goo.gl/iX9dek -o setup_script.sh
bash setup_script.sh
#Clone the HyperLedgerFabric
mkdir -p /home/azureuser/go/src/github.com/hyperledger
cd /home/azureuser/go/src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric.git
cd fabric/
git checkout ae4e37d
cd /home/azureuser/work
git clone https://github.com/IBM-Blockchain/marbles.git --depth 1
cd /home/azureuser/work/marbles
git checkout v4.0
cd /home/azureuser/work
git clone https://github.com/hyperledger/fabric-samples.git
cd /home/azureuser/work/marbles
npm install gulp -g
npm install
echo "Fabric Installation Completed"

