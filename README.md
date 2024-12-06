sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
    2  wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
    3  gpg --no-default-keyring --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg --fingerprint
    4  echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    5  https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    6  sudo apt update
    7  sudo apt-get install terraform
    8  terraform -help
    9  terraform -help plan
   10  touch ~/.bashrc
   11  terraform -install-autocomplete
   12  terraform version

snap install aws-cli --classic
aws configure

   mkdir my-terraform-project
   15  cd my-terraform-project/

    export AWS_ACCESS_KEY_ID=
   39  export AWS_SECRET_ACCESS_KEY=

   
   nano main.tf 
   41  terraform init
   42  terraform init --upgrade
   43  terraform fmt 
   44  terraform validate 
   45  terraform apply 
   46  terraform show
   47  terraform state list 
