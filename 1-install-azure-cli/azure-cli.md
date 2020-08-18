
# Azure CLI windows 
Download msi
https://aka.ms/installazurecliwindows

# docker ubuntu 18.04
# https://docs.docker.com/engine/install/ubuntu/
#prerequisites
```
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install docker-ce docker-ce-cli containerd.io

docker run -it mcr.microsoft.com/azure-cli
```
