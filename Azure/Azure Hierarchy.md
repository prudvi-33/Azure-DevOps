**Azure Hierarchy:** <br/>

![image](https://github.com/user-attachments/assets/a01b73de-9efe-41de-a6ac-5cb3312cb21a)  <br/>

• Azure resource hierarchy is the way resources and services are organized within Microsoft Azure. <br/>
• It provides a logical structure for managing, accessing, and controlling cloud resources. <br/>
• The hierarchy consists of four key levels: <br/>
-- **Management Groups, Subscriptions, Resource Groups, and Resources.** <br/>

![image](https://github.com/user-attachments/assets/aa883eda-e49c-4429-986b-e714cd885ca5) <br/>

• **Azure Active Directory (AAD)**, now called **Microsoft Entra ID**, is Microsoft’s **cloud-based identity and access management** service. <br/>
  It helps secure and manage user identities, authentication, and access to resources in Azure, Microsoft 365, and other cloud apps. <br/>
  
• In Azure, **IAM (Identity and Access Management)** is the feature used to **manage who has access to Azure resources**, what they can do, and what areas they can access. <br/>
It works by assigning **roles to users, groups, or service principals using Role-Based Access Control (RBAC)** at the **resource, resource group, or subscription level.** <br/>

1) **🔹 Azure Tenant?** <br/>

- An **Azure tenant** is a dedicated instance of Microsoft Entra ID (formerly Azure AD) that stores and manages <br/>
  your organization's users, groups, and access to Azure services. <br/>
- It is uniquely identified by a domain like yourcompany.onmicrosoft.com. <br/>
- It’s where all users, groups, service principals, and identities are created. <br/>

![image](https://github.com/user-attachments/assets/d0103298-8699-4a4a-8933-40f65f8f8351)  ![image](https://github.com/user-attachments/assets/824128eb-d8e6-49c9-92b8-82ef5d706853) <br/>

-- All RBAC permissions, policy assignments, and Azure login/authentication start here. <br/>
-- Single Sign-On (SSO), Multi-Factor Authentication (MFA), and Conditional Access policies are enforced here. <br/>

2) **🔹 Management Groups** <br/>

- Management Groups are used to organize multiple Azure subscriptions under a common structure. <br/>
- They allow you to group multiple subscriptions under one umbrella, making it easier to apply policies and manage permissions across all subscriptions. <br/>
![image](https://github.com/user-attachments/assets/9f3940df-f7e2-43d7-b097-c80f26589c5f) <br/>
- Management groups can have **child management groups** or **subscriptions.** <br/>
- You can apply **Azure Policies** or **RBAC roles** at the **management group level,** and they inherit downward. <br/>

3) **🔹 Azure Subscription** <br/>
- An **Azure subscription** is a container that holds a **set of Azure resources** and is used to manage billing, access, and resource usage. It is linked to an Azure tenant and enables you to deploy and organize services under one account. <br/>
-  Every Azure resource lives inside exactly one subscription. <br/>
- Subscriptions allow environment separation (e.g., Dev vs Prod), cost tracking, and access scoping. <br/>

  **✅ Common real-world scenario:** <br/>
   Dev Team works in Dev-Sub <br/>
   Prod Team only gets access to Prod-Sub <br/>

- You can create **multiple subscriptions** inside a tenant or using one Azure account, and there are some limits/Quotas assigned to each subscription. <br/>
- All the subscriptions are attached to the globally unique ID called **Subscription ID** <br/>

4) **🔹 Resource Group** <br/>

- **Resource Groups** are containers within subscriptions that organize related resources. These could include virtual machines, storage accounts, and databases that all belong to a single project or application. <br/>
- You can apply tags, locks, RBAC roles, and policies at the resource group level. <br/>

![image](https://github.com/user-attachments/assets/8c275a8d-4d32-4236-9ff5-0d3dea4d25f5) <br/>

5) **🔹 Resources** <br/>

- **Resources** are the actual Azure services you use — virtual machines, storage accounts, databases, AKS clusters, etc. <br/>

- **Resources** are created inside **resource groups**, and **therefore inside a subscription**, under a **tenant**. <br/>
- Each resource has its own settings, pricing, and lifecycle. <br/>
- Can be managed individually, or through ARM templates / Bicep / Terraform. <br/>


**Summary:**

-- In Azure, everything starts with an Azure AD Tenant, which represents the organization's identity. All users and access permissions are managed at the tenant level. <br/>

Next, we have Subscriptions, which are billing and resource containers. Each subscription lives under a tenant and is isolated from others, allowing us to manage environments like Dev, Test, or Prod separately. <br/>

Within a subscription, we use Resource Groups to logically organize related resources, such as everything needed for a web app (VMs, storage, database) <br/>


