🔹 **Microsoft Hosted Agents:** <br/>

This is a service totally managed by microsoft and it's cleared on every execution of pipeline (on each pipeline execution). <br/>  

⚫ With Microsoft-hosted agents, **maintenance and upgrades are taken care of** for you. <br/>
⚫ You always get the **latest version of the VM image** you specify in your pipeline.<br/>
⚫ **Each time you run a pipeline, you get a fresh virtual machine for each job in the pipeline**. <br/>
⚫ The virtual machine is discarded after one job (which means any change that a job makes to the virtual machine file system, such as checking out code, will be unavailable to the next job). <br/>
⚫ Microsoft-hosted agents can run jobs directly on the VM or in a container. <br/> <br/>

⚫ Azure Pipelines provides a predefined agent pool named Azure Pipelines with Microsoft-hosted agents. <br/>

![image](https://github.com/user-attachments/assets/68b83358-4a66-4044-a5e5-1e8421c033c9) <br/>

🔸 **Self Hosted Agents** <br/>
