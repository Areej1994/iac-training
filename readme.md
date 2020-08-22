# About the course
 
This course will provide you in an virtual hands-on session how to setup infrastructure by using code. Please see agenda with details. After this course you will be able to use common technologies like ARM templates, Powershell to deploy fast and with little effort infrastructure to the Azure Cloud.  

# Schedule
* Day before the actual training:
	* Meeting - Preparation of the system – for all participants
	
* Day 1:
	* 09:00 – 10:00  Part1 - What is Infrastructure as Code (IaC)
	* 10:00 – 11:30  Part2 - Microsoft Azure Automation 
	* 11:30 – 12:30  Lunch Break 
	* 12:30 – 15:30  Part 3 - Setting up an IaC Environment (ARM, PowerShell, Azure CLI) 
	* 15:30 – 16:00  Q&A 
* Day 2:
	* 09:00 – 09:20  Recap 
	* 09:20 – 11:30  Part 4a - IaC Automation Pipelines 
	* 11:30 – 12:30  Lunch Break 
	* 12:30 – 13:00  Part 4b - IaC Automation Pipelines (continued) 
	* 13:00 – 13:30  Q&A 
	* 13:30 – 16:00  Part 5 - Practical Hints and Real life scenarios

# Prerequisites for participants
	* Knowledge of Azure DevOps
	* Basic Knowledge of Git
	* Azure 
		* owner rights on Azure Subscription in order to create resources
		* enough of credit to run the exercises 
		* have enough of privileges on local machine to install used software (e.g. PowerShell modules or  Azure CLI, optionally running from VM in Azure)
        * enough rights on Azure AD (tenant) to create new service principal identity or use existing one ( demonstrate Azure DevOps Service connection and demonstrate deployment to subscription via Azure Pipeline)

# Training Overview  
* Part1 - What is Infrastructure as Code (IaC)
	* In this session we will explore general principles of Introduction to IaC, types of IaC (imperative vs declarative), types of infrastructure in Azure (IaaS, PaaS, SaaS), Shared security responsibility
	
* Part2 - Microsoft Azure Automation
	* In this session we will look at Azure Resource Managed Concept, use Azure Cloud Shell, API, Azure Classic, explore the  
	Azure AD and relationships to tenant, subscription, managed group. Explore specific Azure Resources in respect to IaC- networking, security, databases, VMs, etc. and explore influence of Cloud/Solution Architecture on IaC

* Part 3 - Setting up an IaC Environment (ARM, PowerShell, Azure CLI)
	* In this session we will Install use Azure CLI, Powershell Azure AZ locally, use ARM templates to create Infrastructure in Azure via IaC, explore ARM syntax details and well as way to extend the ARM templates. Will talk about Powershell DSC and Azure Automation (DSC, RunBooks, etc.). Will look at usage of Visual Studio Code to Deploy  ARM via Azure CLI or Powershell.
* Part 4 - IaC Automation Pipelines
	* Configuration as a Code
		* In this session we will focus on configuration of IaC for the purpose of multi environment configuration. Explore Azure DevOps  and KeyVault  integration (Library vs Task), Link ARM  to Key Vault secrets and VM Extension to configure Settings on VM
	* Continuous Integration/Continuous Deployment (CI/CD)
		* In this session we will explore Azure DevOps and prerequisites like Service Principals and Managed Identity to automatically deploy IaC, explore differences between Linux and Windows in respect to the configuration and see additional components required for deployment On-premise vs in Cloud via Build agents (exercise: register the VM as a build agent)
* Part 5 - Practical Hints and Real life scenarios
	* In this session we will try to answer any Q&A, Focus on areas which require more attention based on the group skills. Looking at real life examples and lessons learned from real projects. Based on the time we will cover some additional topics like lock resources, tag Resources, move resources or  Modern Engineering and IaC.

# Training Topics
* Part1 - What is Infrastructure as Code (IaC)
	* Introduction to IaC
		* Video - Infrastructure as code: What is it? Why is it important? (MG: we could get inspired by this introduction to IaC video – it's important to show why it is important. Someday later, we could record a video for this 😊. In the meantime, I can write down the content from the videos to make a document for this) 
		* Video - What is Infrastructure as Code?
		
	* Types of IaC (imperative vs declarative)
		* https://docs.microsoft.com/en-us/azure/architecture/framework/devops/iac
	* Types of infrastructure in Azure (IaaS, PaaS, SaaS)
		* https://docs.microsoft.com/en-us/learn/modules/align-requirements-in-azure/3-service-models
		* https://docs.microsoft.com/en-us/learn/modules/align-requirements-in-azure/4-iaas
		* https://docs.microsoft.com/en-us/learn/modules/align-requirements-in-azure/5-paas
		* https://docs.microsoft.com/en-us/learn/modules/align-requirements-in-azure/6-saas
		
	* Shared security responsibility
		* https://docs.microsoft.com/en-us/learn/modules/azure-well-architected-security/2-defense-in-depth
		
* Part2 - Microsoft Azure Automation
	* Azure Resource Managed Concept
		* https://docs.microsoft.com/en-us/learn/modules/control-and-organize-with-azure-resource-manager/
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/overview
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/managed-applications/overview
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-limits
	* Use Azure Cloud Shell
		* https://docs.microsoft.com/en-us/azure/cloud-shell/overview
		* https://docs.microsoft.com/en-us/azure/cloud-shell/features  *
		* https://docs.microsoft.com/en-us/azure/cloud-shell/using-the-shell-window *
		* https://docs.microsoft.com/en-us/azure/cloud-shell/persisting-shell-storage *
		* https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart
		* https://docs.microsoft.com/en-us/azure/cloud-shell/quickstart-powershell
		* https://docs.microsoft.com/en-us/learn/modules/bash-introduction/
		* (exercise) Open Portal and start Azure Cloud Shell
	* API
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/resource-providers-and-types
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/custom-providers/overview
	* Azure Classic
		* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/deployment-models
	* Azure AD - principles of tenant, subscription, managed group
		* https://docs.microsoft.com/en-us/learn/modules/secure-azure-resources-with-rbac/
	* Specific Azure Resources in respect to IaC- networking, security, databases, VMs, etc. 
		* https://docs.microsoft.com/en-us/learn/modules/welcome-to-azure/3-tour-of-azure-services
		* (exercise) Create Security Principles via Azure Cloud Shell
	* Cloud/Solution Architecture
		* https://docs.microsoft.com/en-us/azure/architecture/
		* https://docs.microsoft.com/en-us/learn/modules/azure-well-architected-security/
		* (exercise) Create in Azure Cloud Shell -TBD

* Part 3 - Setting up an IaC Environment (ARM, PowerShell, Azure CLI)
	* Azure CLI
		* Documentation: https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest
		* https://docs.microsoft.com/en-us/learn/modules/control-azure-services-with-cli/
		* https://docs.microsoft.com/en-us/learn/modules/manage-virtual-machines-with-azure-cli/
		* (list of possible topics) https://docs.microsoft.com/en-us/learn/browse/?terms=Azure%20CLI 
		* https://docs.microsoft.com/en-us/azure/virtual-machines/classic-vm-deprecation
		* (exercise)Create VM via Azure CLI
			* https://docs.microsoft.com/en-us/cli/azure/azure-cli-vm-tutorial?view=azure-cli-latest
	* Use Powershell Azure AZ locally
		* https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7
		* (exercise) Install and execute Azure PowerShell command 
	* Use ARM (Terraform in a Standalone training) to deploy something into the infrastructure
		* Create and deploy ARM templates by using the Azure portal
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal
		* Enhance ARM template
			* e.g. Change size,… update vs replace
			* https://docs.microsoft.com/en-us/learn/modules/automate-azure-tasks-with-powershell/
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-powershell
		* ARM syntax details
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-functions
			* https://docs.microsoft.com/en-us/azure/templates/
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/overview
			* https://docs.microsoft.com/en-us/learn/modules/build-azure-vm-templates/
			* https://docs.microsoft.com/en-us/learn/modules/modify-azure-resource-manager-template-reuse/
			* https://docs.microsoft.com/en-us/learn/modules/create-azure-resource-manager-template-vs-code/ 
			*  https://docs.microsoft.com/en-us/learn/modules/modify-azure-resource-manager-template-reuse/
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/template-best-practices
			² (exersise) Create Key Vault
			² (Azure CLI access to key vault) https://docs.microsoft.com/en-us/azure/key-vault/general/manage-with-cli2
	* Powershell DSC 
		* General principles 
			* https://docs.microsoft.com/en-us/powershell/scripting/dsc/overview/authoringadvanced?view=powershell-7
			* (exercise) Execute locally (on created VM) https://docs.microsoft.com/en-us/powershell/scripting/dsc/quickstarts/website-quickstart?view=powershell-7
			* (Ansible) https://docs.microsoft.com/en-us/learn/modules/configure-infrastructure-azure-pipelines/
			* (Ansible) https://docs.microsoft.com/en-us/azure/developer/ansible/getting-started-cloud-shell?toc=%2Fazure%2Fcloud-shell%2Ftoc.json&bc=%2Fazure%2Fbread%2Ftoc.json
			* (Ansible) https://docs.microsoft.com/en-us/azure/developer/ansible/vm-configure 
			* (exercise) Install IIS on created VM from portal via DSC extension (ARM TBD)
			* (Chef, Puppet) TBD
			* https://docs.microsoft.com/en-us/powershell/scripting/dsc/getting-started/wingettingstarted?view=powershell-7
		* Azure Automation(DSC, Runbooks, etc.)
			* https://docs.microsoft.com/en-us/learn/modules/protect-vm-settings-with-dsc/
			* https://docs.microsoft.com/en-us/azure/automation/quickstart-create-automation-account-template
			
	* ARM in Visual Studio Code
		* Deploy ARM via Azure CLI
			* See above 
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-visual-studio-code?tabs=CLI
		* Deploy  ARM via Powershell
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/deploy-powershell
	* ARM in Visual Studio 
		* Demo deploy from Visual Studio Code
			* ARM Deployment example -TBD

* Part 4 - IaC Automation Pipelines
	* Configuration as a Code
		* Multi environment configuration
			* (exercise) Create Azure DevOps, Create Project, repository, add YAML pipeline
		* Azure DevOps  and KeyVault  integration (Library vs Task)
			* https://docs.microsoft.com/en-us/azure/devops/pipelines/release/azure-key-vault?view=azure-devops
			* https://azuredevopslabs.com/labs/vstsextend/azurekeyvault/
			*  https://docs.microsoft.com/en-us/learn/modules/manage-secrets-with-azure-key-vault/
			* https://docs.microsoft.com/en-us/azure/key-vault/general/manage-with-cli2
		* Link ARM  to Key Vault secrets
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/key-vault-parameter?tabs=azure-cli
		* VM Extension to configure Settings on VM
			* (exercise) change background on VM -TBD
	* Continuous Integration/Continuous Deployment (CI/CD)
		* Azure DevOps (repository, pipelines, CI/CD putting together)
			* https://dzone.com/articles/infrastructure-as-code-a-devops-way-to-manage-it-i
			* https://docs.microsoft.com/en-us/learn/paths/automate-deployments-azure-devops/
			* (exercise) pipeline with creating VM for each environment
		* Service Principals and Managed Identity
			* https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest
			* https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals
		* Differences between Linux and Windows in respect to the configuration (e.g. SSH vs Remote PowerShell)
			* https://docs.microsoft.com/en-us/learn/modules/create-linux-virtual-machine-in-azure/
			* https://docs.microsoft.com/en-us/learn/modules/provision-database-azure-pipelines/
			
		* Deployment On-premise vs in Cloud via Build agents (exercise: register the VM as a build agent)
			* https://docs.microsoft.com/en-us/learn/modules/host-build-agent/
			* Containers – build agent-TBD
			* https://docs.microsoft.com/en-us/azure/devops/pipelines/agents/docker?view=azure-devops
			* https://docs.microsoft.com/en-us/learn/modules/run-docker-with-azure-container-instances/
			* (exercise) register created VM to Agent pool
			* (Terraform , will be trained in standalone training) https://docs.microsoft.com/en-us/learn/modules/provision-infrastructure-azure-pipelines/

* Part 5 - Practical Hints and Real life scenarios
	* Q&A
	* Focus on areas which require more attention based on the group skills. Looking at real life examples and lessons learned from real projects.
		* https://docs.microsoft.com/en-us/learn/modules/choose-azure-service-to-integrate-and-automate-business-processes/
	* Additional topics
		* Lock Resources
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/lock-resources
		* Tag Resources
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/tag-resources
		* Move Resources (Azure CLI)
			* https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/move-resource-group-and-subscription
		* Modern Engineering and IaC
			* Accenture Cloud Platform - Setup and security items 
			* Self-Service Portal (https://messp.avanade.com)
			* Modern Engineering Site  (https://mep.avanade.com)
			* Avanade Docs (https://docs.avanade.com)
			* Cloud Solution Studio (https://www.cloudsolutionstudio.com/)

