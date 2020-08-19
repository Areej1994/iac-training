
# Azure CLI windows 
* Download and install msi https://aka.ms/installazurecliwindows

* run login command 
```
az login
az account list
```

# Azure CLI in Docker

## docker ubuntu 18.04
## https://docs.docker.com/engine/install/ubuntu/
* Install Docker on ubuntu 18.04.
```
sudo apt-get install curl apt-transport-https ca-certificates software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo systemctl status docker
sudo docker run hello-world
```

* run Azure CLI in contaner
* https://docs.microsoft.com/en-us/cli/azure/run-azure-cli-docker?view=azure-cli-latest
```
sudo docker run -it mcr.microsoft.com/azure-cli
```
