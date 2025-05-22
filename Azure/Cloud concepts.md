🔐 **What is Private Link in Azure?** <br/>
Azure Private Link allows you to securely access Azure services (like Blob Storage, SQL Database, Web Apps) or your own services <br/>
over a private IP address within your virtual network (VNet). <br/>

📍 **What is a Private Endpoint?** <br/>
A Private Endpoint is the actual network interface in your VNet that uses a private IP address to connect to an Azure service <br/>
via Private Link. <br/>

**Private Link** - Enables private connectivity to Azure services. <br/>
**Private Endpoint** - A private IP address in your VNet that connects you privately to the service. <br/>

🔧 **Scenario:** <br/>
You have a storage account and want your VM in a VNet to access it securely without going over the internet. <br/>


🔍 **Example DNS:**
Before: <br/>
myaccount.blob.core.windows.net → Public IP <br/>

**After Private Endpoint:** <br/>
myaccount.blob.core.windows.net → Private IP (e.g., 10.1.0.5) <br/>

