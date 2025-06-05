1) When you try access kubernetes private cluster(AKS) objects like deployments,statefulsets etc. you will see like <br/>

![image](https://github.com/user-attachments/assets/f03ff602-f5d2-4e69-85c2-71e85fc2e132)  <br/>

In that case, you can access the cluster resources/objects through cmd in ur local:  <br/>
   1) az aks command invoke --resource-group "rg-doc-ai-studio-dev-01" --name "aks-docaistudio-hc" --command <'kubectl get cm'> <br/>

===========================================================================================================================
<br/> **Commands To get Roles (Cluster-wide roles and Namespace-specific roles):**  <br/>

![image](https://github.com/user-attachments/assets/af2d66b7-09ba-434c-bce5-9982f8d72c26)  ![image](https://github.com/user-attachments/assets/c05abb87-5721-4f4a-a8a8-b6c46def8c89)
<br/>
![image](https://github.com/user-attachments/assets/2fe59af2-95f3-4bbc-b5ee-49c7f07a2b6c) <br/>

============================================================================================================================

**🎯 Goal** <br/>

Grant kuna.prudviraj@techolution.com: <br/>
• Ability to get pods, view logs, describe objects <br/>
• Only within a specific namespace (e.g. default) <br/>
• No create/delete access (read-only) <br/>
• Read-only access using **Kubernetes RBAC** <br/>

**✅ Prerequisites**  <br/>
• Ensure AKS cluster is using Kubernetes RBAC (not Azure RBAC). <br/>
• You have **kubectl** access to the AKS cluster <br/>
• The user (kuna.prudviraj@techolution.com) is using Azure AD for login <br/>
• AKS cluster is using **Kubernetes RBAC** <br/>

**🧩 Step-by-step Implementation** <br/>

![image](https://github.com/user-attachments/assets/92ff628a-a624-4512-b615-11e9bd21f3b2)  ![image](https://github.com/user-attachments/assets/b9930757-cb95-4765-9e40-28b784041925) <br/> 

![image](https://github.com/user-attachments/assets/17a58caf-a366-4283-8e2c-101c6a09529b) <br/>






