In **Terraform**, the **required_providers** block and the **provider** block are both used to configure and specify providers,
but they serve different purposes: <br/>

🔹 **required_providers Block** <br/>
Declares which providers your Terraform configuration depends on. <br/>
Specifies source and version for each provider. <br/>
Typically defined in the terraform block. <br/>

🔹 **provider Block** <br/>
Configures how to connect to the specific cloud or platform. <br/>
Sets things like region, credentials, etc. <br/>

**Provider:** A plugin that Terraform uses to interact with cloud platforms (like AWS, Azure, etc.). <br/>
**hashicorp/azurerm** is the Terraform Azure provider published by HashiCorp. <br/>

🔁 **lifecycle Block in Terraform** <br/>
✅ **Purpose:** <br/>
To control how Terraform handles resource creation, update, and deletion. <br/>

🔧 Syntax: 


![image](https://github.com/user-attachments/assets/8faf0c33-d130-4314-acc6-2a6b1fe35382) <br/>
🎯 **Why It's Needed:** <br/>
To prevent disruptions, accidental deletions, or unwanted updates. <br/>

**2. prevent_destroy**  <br/>
Protects a critical resource from being accidentally destroyed. <br/>

**Use Case:** Production database or VNet. <br/>

![image](https://github.com/user-attachments/assets/0427b9e5-0adf-4382-910b-ac42686d0a7a) <br/>

🔒 **prevent_destroy = true** — What It Actually Does <br/>
✅ Behavior: <br/>
Terraform will block the destroy operation, even if: <br/>
  --You run terraform destroy <br/>
  --A resource must be destroyed due to a configuration change <br/>

**3. ignore_changes** <br/>
Terraform ignores changes in specified attributes. <br/>
**Use Case**: Attributes modified externally (e.g., manually updated tags)  <br/>

![image](https://github.com/user-attachments/assets/ff46dcf5-1df7-4412-8dec-43f33061abea) <br/>

🔄 **dynamic Block in Terraform** <br/>
✅ **Purpose:** <br/>
To generate blocks dynamically based on a loop or condition, reducing repetition and improving maintainability. <br/>

![image](https://github.com/user-attachments/assets/6eabceaf-2005-45ec-b6eb-e5ab2df6dadf)  <br/>

Then: <br/>
![image](https://github.com/user-attachments/assets/5e58d6ad-f684-4932-96a6-851253d968e3) <br/>

🔍 **What Terraform does under the hood**: <br/>
**It generates two ingress blocks, like this**: <br/>

![image](https://github.com/user-attachments/assets/df3774ee-9a49-455f-ad0b-c84d804afac1)

===================================================================================================================

**Variables Constraints:** <br/>

In **Terraform (especially with Azure)**, understanding **map(string)** and **map(object)** is crucial when dealing with complex inputs like **tags**, **resource configurations**, or **dynamically generated blocks.** <br/>

**🔹 What is a map(string)?** <br/>
A map(string) is a key-value pair where the **key is a string**, and the **value is also a string**.  <br/>

**✅ Why use map(string)?**  <br/>
For simple string-based inputs like tags, environment-specific values, or name-to-value mappings. <br/>
Easy to loop over using for_each. <br/>

**Example:** <br/>

![image](https://github.com/user-attachments/assets/0e65b471-a613-4d94-840d-b015562892ab) <br/>

Here, the tags variable is a map of strings. Terraform will expand this into: <br/>

![image](https://github.com/user-attachments/assets/9872ec82-4ff4-4785-a88a-524bca699647) <br/>

**🔹 What is a map(object)?** <br/>
A map(object) is a more advanced mapping, where each key maps to an object (a group of named attributes with types). <br/>

**✅ Why use map(object)?** <br/>
When you need to define structured configuration per key. <br/>
Useful for defining multiple resources dynamically with complex properties. <br/>

🧠 Object = { key1 = type1, key2 = type2 }

![image](https://github.com/user-attachments/assets/5f13b761-7811-48e4-a1da-d3ecf602e281)   <br/>

![image](https://github.com/user-attachments/assets/8efdb7a4-2c0f-4450-b4e8-c1e9037eb49b)  ![image](https://github.com/user-attachments/assets/89c20678-6d51-460e-b182-28ba75d19314)













