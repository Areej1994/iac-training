# Azure CLI Create VM in bash (use bash installed with git for windows or WSL)


# https://docs.microsoft.com/en-us/cli/azure/azure-cli-vm-tutorial?tutorial-step=1&view=azure-cli-latest 

az login
az account list
az account set -s 'name of the subscription' 

# & ~\AppData\Local\Programs\Git\git-bash.exe

# !!! change Prefix to be unique Resource group name  
RESOURCE_GROUP_NAME='vb-iac-taining-cli-rg'
az group create --name $RESOURCE_GROUP_NAME  --location eastus

az vm create --resource-group $RESOURCE_GROUP_NAME \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --size Standard_B2S \
  --verbose

# copy IP address from output
ssh <PUBLIC_IP_ADDRESS>

# Set environment variables from CLI output
az vm show --name TutorialVM1 --resource-group $RESOURCE_GROUP_NAME

az vm show --name TutorialVM1 \
  --resource-group $RESOURCE_GROUP_NAME \
  --query 'networkProfile.networkInterfaces[].id' \
  --output tsv

NIC_ID=$(az vm show -n TutorialVM1 -g $RESOURCE_GROUP_NAME \
--query 'networkProfile.networkInterfaces[].id' \
-o tsv)

az network nic show --ids $NIC_ID

read -d '' IP_ID SUBNET_ID <<< $(az network nic show \
  --ids $NIC_ID \
  --query '[ipConfigurations[].publicIpAddress.id, ipConfigurations[].subnet.id]' \
  -o tsv)

VM1_IP_ADDR=$(az network public-ip show --ids $IP_ID \
  --query ipAddress \
  -o tsv)

echo $VM1_IP_ADDR

#Creating a new VM on the existing subnet
VM2_IP_ADDR=$(az vm create -g $RESOURCE_GROUP_NAME \
  -n TutorialVM2 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --size Standard_B2S \
  --subnet $SUBNET_ID \
  --query publicIpAddress \
  -o tsv)

ssh $VM2_IP_ADDR

