#!/bin/bash
#Verify if git is installed
echo git --version
#Verify home path
echo $HOME
cd $HOME
#Create a work directory to host the source code
mkdir work
#Install GO
echo "---------------Installing GO------------------"
sudo apt-get update
sudo apt-get -y upgrade
sudo curl -O https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz
sudo tar -xzf go1.9.1.linux-amd64.tar.gz
echo "--------------GO Installed--------------------"
#Set GOPATH and GOROOT
export GOPATH=$HOME/work
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
#Install Node 6.x and NPM
echo "------------Installing Node.js----------------"
sudo curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install -y nodejs 
sudo apt-get install -y build-essential
sudo npm install npm@3.10.10 -g
echo "--------Node.js Installation Completed--------"

#Install Docker and Docker Compose
echo "-----Installing Docker and Docker Compose-----"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo apt install -y docker-compose
echo "--Docker & Docker Compose Installation Completed--"

#Setup Hyperledger Components
curl -sSL https://goo.gl/iX9dek -o setup_script.sh
sudo bash setup_script.sh
#Clone the HyperLedgerFabric
mkdir -p $HOME/go/src/github.com/hyperledger
cd $HOME/go/src/github.com/hyperledger
git clone https://github.com/hyperledger/fabric.git
cd fabric/
git checkout ae4e37d
cd $HOME/work
git clone https://github.com/IBM-Blockchain/marbles.git --depth 1
cd $HOME/work/marbles
git checkout v4.0
cd $HOME/work
git clone https://github.com/hyperledger/fabric-samples.git
cd $HOME/work/marbles
sudo npm install gulp -g
sudo npm install
echo "Fabric Installation Completed"
