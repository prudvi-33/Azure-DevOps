🔹 **Microsoft Hosted Agents:** <br/>

This is a service totally managed by microsoft and it's cleared on every execution of pipeline (on each pipeline execution). <br/>  

➤ With Microsoft-hosted agents, **maintenance and upgrades are taken care of** for you. <br/>
➤ You always get the **latest version of the VM image** you specify in your pipeline.<br/>
➤ **Each time you run a pipeline, you get a fresh virtual machine for each job in the pipeline**. <br/>
➤ The virtual machine is discarded after one job (which means any change that a job makes to the virtual machine file system, such as checking out code, will be unavailable to the next job). <br/>
➤ Microsoft-hosted agents can run jobs directly on the VM or in a container. <br/> <br/>

➤ **Azure Pipelines** provides a **predefined agent pool** named **Azure Pipelines** with **Microsoft-hosted agents**. <br/>

![image](https://github.com/user-attachments/assets/68b83358-4a66-4044-a5e5-1e8421c033c9) <br/>

➤ Microsoft-hosted agents that run Windows and Linux images are provisioned on Azure general purpose virtual machines with a 2 core CPU, 7 GB of RAM, and 14 GB of SSD disk space. <br/>

🔸 **Self Hosted Agents** <br/>

➤ This is a service that you can to setup and manage by yourself. This can be custom Virtual machine on Azure or on-premise machine inside ur infrastructure. <br/>
➤ In a self hosted agent, you can install all the software you need for ur builds, and this is persisted on every pipeline execution. <br/>
➤ A self-hosted agent can be Windows, Linux, Mac OS or in a Docker container. <br/>

**Prerequisites:** <br/>

➤ Azure Accpunt with active subscription. <br/>
➤ Create a Ubuntu VM in Azure Cloud (under Virtual Machines Resource). <br/>
➤ Create Personal Access Token in Azure DevOps. <br/>

**How to configure Self Hosted Agent in Azure DevOps** <br/>

1. Go to Azure DevOps dashboard - https://dev.azure.com/ <br/>
2. Select your project dashboard. <br/>
3. Go to your project settings. <br/>
         ![image](https://github.com/user-attachments/assets/5a84dc88-7247-4726-8502-c871f917cfd5) <br/>
4. Click Agent Pools. <br/>
        ![image](https://github.com/user-attachments/assets/f1a720c9-9340-4a21-9875-d564cb06890d) <br/>
5. Create a new Agent pool name <br/>
 ![image](https://github.com/user-attachments/assets/e3022d35-db21-4e8f-9748-df5112075101)
6. Select Pool Type. <br/>
![image](https://github.com/user-attachments/assets/ad3556c3-41a9-409c-b82d-94a147094987)
7. Give any custom pool name you want and then Click Create. <br/>
8. Click on newly created pool name, you will see like Agents. <br/>
![image](https://github.com/user-attachments/assets/2890806a-f3a8-4b8c-9b11-3a0c0d075f81) <br/>
9. By clicking on **New Agent** on top right, U will see like this. <br/>
![image](https://github.com/user-attachments/assets/5c74da25-3e90-4e6a-bdb2-93f40d91a0a5) <br/>
10. Based on VM u choose, please select the same OS type and need to run these instructions in newly created VM <br/>

