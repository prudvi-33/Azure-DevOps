🔹 **Install Kubernetes and Auth with AKS in Linux VM** : <br/>
   ==============================================================

**Prerequisites:** <br/>
1. Microsoft Azure account. <br/>
2. Newly created Linux VM. <br/>

🔹 **Let's begin the show.** <br/>

 Once you successfully create the Linux(Ubuntu) VM, Navigate to the VM as below: <br/>

 ![image](https://github.com/user-attachments/assets/62d74bef-5fc8-4125-a662-468d6f7c4d8d)  <br/>

 ✦ In the top right, Select the **Cloud shell**, One of the way to login to VM. <br/> <br/>

 ✦ If you've created the VM to authenticate with username and password, then login to the VM like below, <br/>

 ![image](https://github.com/user-attachments/assets/3773d216-7978-418c-9a01-4706fdd96621) <br/>

Once you've successfully logged into the VM as above, follow the below steps 🔽 <br/>

 ✅ **Step 1**: Install **kubectl** <br/> <br/>
         **sudo apt-get update** <br/>
         **sudo apt-get install -y apt-transport-https ca-certificates curl** <br/>

 ✅ Login to **Azure** from the **VM** <br/> <br/>
         **az login** <br/>

 ✅ Install **kubectl** and **kubelogin** from **az command** itself.(A quick way) <br/>      
         **sudo az aks install-cli** <br/>

➤ It downloads and installs **kubectl** (the Kubernetes CLI) that's compatible with Azure AKS. <br/>

 ✅   After that, verify install, <br/> <br/>
         **kubectl version --client** <br/>

 ✅   Connect to AKS <br/><br/>
         **az aks get-credentials --resource-group rg-doc-ai-studio-dev-01 --name aks-docaistudio-hc** <br/>
 

