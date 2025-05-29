**🔐 Deep Dive: App Registrations, Enterprise Applications, and Service Principals in Azure AD** <br/>

![image](https://github.com/user-attachments/assets/241c4c68-4a71-48af-93af-34dc618c2f61) <br/>

**Azure AD** isn’t just for users — it also manages applications that need to authenticate and access resources. <br/>

**Application Registration(App Registration)?** <br/>

- Application Registration refers to the process of registering an application with Azure Entra ID. <br/>
- This is typically done when you’re developing or integrating an application that must **securely interact with Azure services** or other Microsoft services. <br/>

![image](https://github.com/user-attachments/assets/fcddda51-04cd-497b-9be5-317ecc470b88) <br/>

![image](https://github.com/user-attachments/assets/7f26fb8d-b586-4935-9942-8abfe2142682) <br/>

- When you register an application, Azure assigns it a unique Application (client) ID and Directory (tenant) ID. <br/>
- After successful registration of your app, you will notice the app is created in 2 places — **“App Registrations”** and <br/> **“Enterprise applications”**. It created a **globally unique identifier Application (client) ID** in **Application Registration** and a <br/> **local Service Principal Object** with the **same name** in the **Enterprise Application**. <br/>

![image](https://github.com/user-attachments/assets/3be80871-5bbd-4905-8c9a-57c5c7069334) <br/>

??????????????????????????????????????????????????????????????????????????????????????????????????????????????
- Apps under **“App Registrations”** represent the actual application object. <br/>

![image](https://github.com/user-attachments/assets/45ec7455-b9aa-460e-892f-13cb797fd578) <br/>

- This is the place where you **set the authentication and authorization requirements of your app.** <br/>

![image](https://github.com/user-attachments/assets/66624540-cbcf-4a65-9346-2f0dbdd69cc1) <br/>

-- **Certificates and Secrets:** You can generate client secrets or upload certificates for authentication.
   Your app will pass credentials, i.e. either via a client secret or a certificate to Azure AD to prove its identity, and therefore request tokens <br/>
-- **Redirect URIs:** Specify the URLs where Azure AD redirects users after authentication. <br/>

**When to Use Application Registration?** <br/>
**Developing Custom Applications:** You’re building a web, mobile, or desktop application that needs secure access to Azure resources or Microsoft APIs. <br/>

=========================================================================================================================

**Enterprise Application**  <br/>
- An Enterprise App with the same name is automatically created once you register an application. <br/>

![image](https://github.com/user-attachments/assets/0ced7a18-6c8e-4309-9328-96d9487b465c) <br/>

- The configurations that you have set for your app under App Registrations are referenced by your Enterprise Application. <br/>


