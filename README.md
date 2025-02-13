## Install Terraform

sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \

https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update

sudo apt-get install terraform

terraform -help

terraform -help plan

touch ~/.bashrc

terraform -install-autocomplete

terraform version

## Install AWS-CLI

snap install aws-cli --classic

## Configure AWS-CLI

aws configure

## Create Terraform Directory

   mkdir my-terraform-project
   
cd my-terraform-project/

    export AWS_ACCESS_KEY_ID=
    
export AWS_SECRET_ACCESS_KEY=

   
   nano main.tf 
   
terraform init
   
terraform init --upgrade
   
terraform fmt 
   
 terraform validate 
   
terraform apply 
   
terraform show
   
terraform state list 
