1) **Set the New Subscription** <br/>
az account set --subscription "subscription-id-or-name" <br/>

2) **To see the subscription details** <br/>
        az account show <br/>

*  **CMD's to login to Azure** <br/>
        az login <br/>
        az login --use-device-code <br/>

3) **🧾 List All Subscriptions** <br/>
        az account list --output table <br/>

4)
 ![image](https://github.com/user-attachments/assets/e718f72b-427c-47ce-942b-2ad987d823cb) <br/>

5) ✅ **Get List of Registered Resource Providers**: <br/>
   📦 **Command to get only registered ones:** <br/>
        az provider list --query "[?registrationState=='Registered'].{Namespace:namespace}" --output table <br/>
        
 ![image](https://github.com/user-attachments/assets/1420dea5-9edd-4201-a46f-7e2970f54dab) 

 ==============================================================================================================

 6) **If you want to check which Managed Identity your AKS cluster was**? <br/>

  az aks show --name aks-docaistudio-hc --resource-group rg-doc-ai-studio-dev-01 --query identity <br/>
  
 ![image](https://github.com/user-attachments/assets/16ff7c7f-63e2-4363-8c4e-6d53c8fdcb39) <br/>

7) 

   



        
