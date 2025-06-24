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
10. Based on VM u choose, please select the same OS type and need to run these instructions in newly created VM. <br/>

Note down the steps to configure Linux build agent. <br/>
Login to your **Azure VM** now. <br/>
➥ As you have Linux VM, try to ssh into it, using Cloud shell. <br/>
➥ ssh "username"@"IP", then it will prompt u to enter pwd(If u choose as pwd, while VM creation) <br/>
➥ Once you enter pwd and click enter, U will be successfully logged into VM. <br/>

![image](https://github.com/user-attachments/assets/ee6bb4cb-23da-4c81-978d-9ad68faca3a1) <br/>


**Now Process of installing Agent inside VM in Steps**,  <br/>

**Pre-requisite:** <br/>
Install the libs, dependencies needed for the Agent installation. <br/>

  **sudo apt update && sudo apt install -y unzip curl wget** <br/>
  
**Step #1** - Create the Agent <br/>
       mkdir myagent && cd myagent <br/>
       
**Step #2** - Download the agent <br/>
Navigate to <br/>
https://github.com/microsoft/azure-pipelines-agent/releases <br/>
and **Copy the url** based on which OS the agent needs to be downloaded. <br/> <br/>
![image](https://github.com/user-attachments/assets/5bfcc511-9c87-47bc-9664-a8f9470a0087) <br/> <br/>

      wget https://download.agent.dev.azure.com/agent/4.258.1/vsts-agent-linux-x64-4.258.1.tar.gz and then enter <br/>
It will download the agent. <br/>

**Step #3** - Configure the Agent. <br/>
     tar zxvf vsts-agent-linux-x64-4.258.1.tar.gz <br/>



and then List the files in the directory after extracting. <br/>
     ls -al <br/>
You should see like.. <br/>

![image](https://github.com/user-attachments/assets/a7705875-cd42-4e8b-a74e-f3dc4c52764c) <br/>

**Step #4:** Run the below command: <br/>
     ./config.sh  <br/>

     ![AD01](https://github.com/user-attachments/assets/ffe3acf9-b730-4bc0-943e-4888e6ec5958) <br/>

Accept the Team Explorer Everywhere license agreement now? <br/>
Type Y and enter     <br/>

     ![image](https://github.com/user-attachments/assets/4c364647-3e8e-4060-b6cd-f84968ba4d59) <br/>


**Step #5:** <br/>
Enter server URL > <br/>
https://dev.azure.com/yourorganization <br/>

**Step #6:** <br/>
Enter authentication type (press enter for PAT) > **PAT** <br/>    
You can get the PAT from: <br/>
  ![image](https://github.com/user-attachments/assets/f7b23cbf-6cfb-45bd-a672-3524d4a32494) <br/>

**Click here**  to create/Generate new Token <br/>

  ![image](https://github.com/user-attachments/assets/d7fdce9e-e0d4-4b48-b8b1-f609a5f9fc84) <br/>

**Step #7:** </br>
Enter personal access token <br/>

  ![image](https://github.com/user-attachments/assets/3e7595d8-d4e6-40ee-a33d-b41695b416de) <br/>


**Step #8:** <br/>
Enter Agent pool <br/>
Give Agent pool name <br/>
 
**Step #9:** <br/>
Enter Agent name --> **myBuildAgent_1**/ Ur wish(based on ur project) <br/>

**Step #10:** <br/>
Enter work folder > enter(just enter/no need to type) <br/>
  ![image](https://github.com/user-attachments/assets/f5450b45-6895-415e-ba70-3d5c1bfef0f6) <br/>

🔥 **that's it!!! agent is successfully configured.** 🔥 <br/>
============================================================

⚫ **Configure the Agent to run as a Service** : <br/>

You can able to see **svc.sh** file here, <br/>
![image](https://github.com/user-attachments/assets/1ff73098-b378-4a88-a75b-a0096a26c617) <br/>

    sudo ./svc.sh install ⏎ <br/>
    sudo ./svc.sh start <br/>

**Check the status of build Agent** <br/>
**Click on the newly created pool name.** <br/>
**Click on Agents** <br/>

![image](https://github.com/user-attachments/assets/8c267a1e-487b-4740-b65a-6d4558388c87) <br/>

🎉 **Woah! We’ve successfully completed the end-to-end setup of a self-hosted agent for Azure DevOps** 🚀💻🔧

