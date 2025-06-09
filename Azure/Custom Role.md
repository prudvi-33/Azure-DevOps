**Authentication and Authorization for AKS Cluster is classified into two types:** <br/>

![image](https://github.com/user-attachments/assets/2d6ee969-fc33-425e-a18c-8bc63c1509f8) <br/>

**✅ Steps to Check if Azure RBAC is Enabled in Azure Portal** <br/>

Go to Azure Portal → https://portal.azure.com <br/>
Search for your AKS cluster: <br/>
Example: aks-llmstudio-hc-01 <br/>

On the left pane of the AKS resource, scroll down to find “Settings” → “Security Configuration” → “Authentication”

In the Authentication blade/page, check the options: <br/>
![image](https://github.com/user-attachments/assets/f5059940-d97c-4e53-88c6-81ec142534e5) <br/>

===================================================================================================================

A Developer(dharnidhar) wants to access **get pods, check pods logs etc**,then as a Cloud Engineer, we should assign Roles/RBAC with principal 
of least privilege. <br/>

If <br/>

![image](https://github.com/user-attachments/assets/602315a9-5f73-48b0-a8e2-d5d84bd4309c) <br/>

![image](https://github.com/user-attachments/assets/e01eb1e0-9423-4754-81c8-88fa2ae6c497) <br/>

But even though we assign Roles to him,  <br/>
![image](https://github.com/user-attachments/assets/91428b71-ac5d-4d90-a3f0-93fe9f282825) <br/>

If he still faces the below error <br/>
![image](https://github.com/user-attachments/assets/a1c49f2f-c182-4f3a-aa0a-86a52db4d49c) <br/>
then, <br/>
![image](https://github.com/user-attachments/assets/e9e79b23-1d1f-4fe9-aca1-8226ad78333e) <br/>

**We would need to create Custom Azure RBAC Role Definition that allows only the permission required for AKS Run Command (i.e., Microsoft.ContainerService/managedClusters/runCommand/action).** <br/>

![image](https://github.com/user-attachments/assets/82429bf3-c20a-47ff-a823-b335b87193c7) <br/>

![image](https://github.com/user-attachments/assets/87a2f9d6-c2e9-4273-8ced-2335ac69a0a7) <br/>

then run command :  **az role definition create --role-definition "file-name.json"** <br/>

This will create **Custom Role** <br/>

Now, Assign this role, to a user(Developer) using below command, <br/>
**az role assignment create --assignee dharanidhar.reddy@techolution.com --role "AKS Run Command Executor" --scope /subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.ContainerService/managedClusters/aks-llmstudio-hc-01** <br/>

✅ This will assign the custom role (AKS Run Command Executor) to Dharanidhar on the specific AKS cluster scope. <br/>

![image](https://github.com/user-attachments/assets/df2cfdc3-5274-4237-ab44-0840a500c581) <br/>

**az role assignment create --assignee "object-id/Assignee name" --role "AKS Run Command Executor" --scope /subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.ContainerService/managedClusters/aks-llmstudio-hc-01** <br/>

====================================================================================================================

 















