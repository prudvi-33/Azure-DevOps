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
