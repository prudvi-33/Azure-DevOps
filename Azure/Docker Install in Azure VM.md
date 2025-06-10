**Installing Docker and connecting to ACR in involves few steps:** <br/>

**We will do those steps in an Azure VM** <br/>
==================================================

1. Login to Azure Portal. <br/>
2. Nagivate to Azure VM, Choose the VM you want to Connect. <br/>
3. I've created a VM with username and password. <br/>
4. So, here, We can connect to VM using **Azure cloud shell/Terminal**. <br/>

    **SSH into the VM using Azure Cloud shell.** <br/>

**ssh <your-vm-username>@<your-vm-public-ip-or-dns-name>**  <br/>
U will see like: <br/>

![image](https://github.com/user-attachments/assets/da062c75-1412-4086-8d47-6e6308418692) <br/>

**Once you login:** <br/>

1)Update package lists and install prerequisites: <br/>
This ensures your system is up-to-date and has the tools needed to add Docker's repository. <br/>

**sudo apt update -y <br/>
sudo apt install ca-certificates curl gnupg lsb-release -y** <br/>

2)  Add Docker's official GPG key: <br/>
This ensures your system is up-to-date and has the tools needed to add Docker's repository. <br/>

**sudo mkdir -p /etc/apt/keyrings <br/>
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg** <br/>

3) Set up the Docker repository: <br/>
This tells your system where to find the Docker packages. <br/>

**echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null** <br/>

4) Install Docker Engine and related components: <br/>
Now, you can install Docker itself. <br/>

**sudo apt update -y <br/>
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y** <br/>

5) (Crucial!) Allow your user to run Docker commands without sudo: <br/>
By default, only the root user can run Docker commands. To avoid typing sudo every time, add your current user to the docker group. <br/>

**sudo usermod -aG docker $(whoami)** <br/>

6) For the Group Membership to take effect, try to exit and login again. And you can run <br/>

 **docker version** <br/>

===========================================================================================================================
**Next Step: Login to ACR from the VM** <br/>

Now that Docker is fully installed and your user has the correct permissions on your VM, you can proceed with logging into your Azure Container Registry (ACR) from the VM: <br/>

1) Log in to your Azure account from the VM: <br/>

   **az login** <br/>
2) Log in to ACR from the VM: <br/>

   **az acr login --name "your-acr-name"**  <br/>
   Eg:  **az acr login --name crdocaistudiohc.azurecr.io** <br/>

   It will prompt you to enter **username** and **password**. You will get it those from, <br/>

![image](https://github.com/user-attachments/assets/70da4a8e-4467-4eed-b623-80a903e2455e) <br/>

Once you enter those details, you are Good!!


This is how we install Docker and authenticate with ACR in Azure VM!!! Woah!!! <br/>
===========================================================================================================
