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











