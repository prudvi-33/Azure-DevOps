* In Azure, every **Resource Group** is tied to exactly **one Subscription** <br/>

✅ **Key Relationship** <br/>

**Subscription** → contains Resource Groups <br/>
**Resource Group** → contains Resources (VMs, NSGs, Storage, etc.) <br/>

![image](https://github.com/user-attachments/assets/47909198-2455-4f6c-b12d-e5d929116b6e)  <br/>

================================================================================================================================

* **✅ Resource Providers in Azure?** <br/>

In Azure, a **resource provider** is a service that supplies resources you can deploy and manage — like VMs, storage accounts, AKS clusters, etc. <br/>

Each resource type (e.g., Microsoft.Compute/virtualMachines, Microsoft.Storage/storageAccounts) comes from a resource provider, like: <br/>

![image](https://github.com/user-attachments/assets/7a80ff4e-e805-47f1-aa7b-56bf33e041af) <br/>

🛠️ **Why You Might Need to Enable Them** <br/>
If you try to deploy a resource and the provider isn’t registered for your subscription, Azure will throw an error like: <br/>

**"The subscription is not registered to use namespace 'Microsoft.XXX'"** <br/>

That’s when you enable/register the provider. <br/>

![image](https://github.com/user-attachments/assets/cd32f2eb-afe0-49c2-869b-561af35e22f6) <br/>

You enable a provider (aka register it) when you’re deploying a type of resource for the first time and Azure needs permission to allow it under your subscription. <br/>

==============================================================================================================

**Azure Identity Types – User, Service Principal, and Managed Identity**

In Azure, access to resources is managed through Azure Active Directory (Azure AD). <br/>
There are three primary types of identities used for authentication and authorization: User, Service Principal (SP), and <br/> Managed Identity (MI). Each is designed for a specific purpose and has its own usage pattern and flow. <br/>

**1. Azure AD User** <br/>

This refers to an actual human identity — like a developer, admin, or operator — who logs into Azure manually. This identity <br/> is tied to a person and is mainly used for interactive, manual access. <br/>
 --- Accessing the Azure Portal. <br/>
 --- Running CLI or powershell commands using **az login** <br/>
 
**2. Service Principal (SP)** <br/>

An Azure Service Principal is a security identity used by applications, services, and automation tools to access Azure resources. <br/>

-- Service principals are used to authenticate and authorize deployment scripts or tools to access and deploy resources in Azure. <br/>
-- SPNs can be assigned **specific roles** with minimal permissions required to perform their functions, adhering to the **principle of least privilege**. <br/>
-- **SPN**s are essential for automation scenarios, such as CI/CD pipelines, and for integrating third-party applications with Azure resources. <br/>
     
**3. Managed Identities** <br/>

Managed Identities are a feature of Azure Entra ID (formerly Azure Active Directory) that automatically manages the identity <br/> of your Azure resources. When you enable a Managed Identity for a resource, Azure creates and rotates the credentials, <br/> ensuring secure communication between your application and other Azure services. <br/>

**Types of Managed Identities:** <br/>

**System-Assigned Managed Identity:** Tied to a specific Azure resource. If the resource is deleted, the identity is also removed. <br/>
**User-Assigned Managed Identity:** Created as a standalone Azure resource and can be assigned to multiple Azure resources. <br/>

-- Used When an Azure resource needs to securely access another Azure service. <br/>

**Summary Flow Understanding** <br/>

**User identity** is used when a real person interacts with Azure manually. <br/>
**Service Principal** is used when an automation or script outside Azure (e.g., in a CI/CD tool) needs to access Azure services. <br/>
**Managed Identity** is used when an **Azure-hosted service (like a VM, App Service, or AKS)** needs to securely access another **Azure service** without handling credentials. <br/>

All three identities authenticate via Azure AD and must be granted the appropriate **RBAC role** to access resources. <br/>

=============================================================================================================================











