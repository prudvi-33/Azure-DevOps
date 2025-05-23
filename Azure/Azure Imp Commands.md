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

        ![image](https://github.com/user-attachments/assets/326bb7b5-5e9e-41b6-a9ea-46bc633702b2)



        
