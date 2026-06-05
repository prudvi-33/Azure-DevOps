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

===========================================================================================================

**Command to check networking type for AKS cluster** <br/>

**az aks show -g rg-doc-ai-studio-dev-01 -n aks-docaistudio-hc --query "networkProfile.networkPlugin" -o tsv** <br/>

========================================================================================================================

Persistent Volume, PVC and Storage classes:
===============================================

➤ The **PVC** is how a **developer** asks for **storage**. <br/>
➤ Example, if a developer comes in and asks for a **10 GB read write access** storage. <br/>
Kubernetes **finds a PV** that matches and binds them together. Then in your pods **pack you reference this claim** and inside the **container you mount it at a path**. <br/><br/>

<img width="486" height="242" alt="image" src="https://github.com/user-attachments/assets/41451d7e-0150-4d7e-825d-b38c7174b33c" />


➤ Now things to note here. <br/>
First the **access modes.**  It could be **read write once**,**read only many** or **read write many**. This is basically the **access permission you set on the pod level**. Then the amount of storage requested and the storage class that should provision it. <br/>

<img width="506" height="126" alt="image" src="https://github.com/user-attachments/assets/f1d435ac-9330-4440-a712-60076a927ff2" />

Storage Class:
==============

➤ Imagine a cluster with 100s of apps **requesting storage** every day. An admin creating **persistent volumes manually** for each one. It doesn't scale. That's where the **storage class comes in**.
➤ A storage class **dynamically provisions PVs** on demand. This is the flow. 

<img width="475" height="253" alt="image" src="https://github.com/user-attachments/assets/c2478536-ce8a-4a2e-a113-cbec65c0fe08" />

⤷ Pod is created with PVC. 
⤷ PVC requests storage class. 
⤷ Now provisioner calls cloud API, cloud creates the disk. 
⤷ The PV is created and then it's bounded to PVC and mounted into the pod. 
⤷ Now when a developer creates a PVC and references a storage class, Kubernetes automatically calls the cloud API, creates a disk, creates a matching PV and binds it to the claim. <br/>



