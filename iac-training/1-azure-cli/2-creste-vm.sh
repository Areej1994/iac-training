# Azure CLI Create VM in bash (use bash installed with git for windows)

# https://docs.microsoft.com/en-us/cli/azure/azure-cli-vm-tutorial?tutorial-step=1&view=azure-cli-latest 

az login
az group create --name TutorialResources --location eastus

az vm create --resource-group TutorialResources \
  --name TutorialVM1 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --output json \
  --verbose

#
ssh <PUBLIC_IP_ADDRESS>

# Set environment variables from CLI output
az vm show --name TutorialVM1 --resource-group TutorialResources

az vm show --name TutorialVM1 \
  --resource-group TutorialResources \
  --query 'networkProfile.networkInterfaces[].id' \
  --output tsv

NIC_ID=$(az vm show -n TutorialVM1 -g TutorialResources \
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
VM2_IP_ADDR=$(az vm create -g TutorialResources \
  -n TutorialVM2 \
  --image UbuntuLTS \
  --generate-ssh-keys \
  --subnet $SUBNET_ID \
  --query publicIpAddress \
  -o tsv)

ssh $VM2_IP_ADDR

