<img width="220" height="83" alt="image" src="https://github.com/user-attachments/assets/d0f9f4aa-723f-48e0-a583-32b04f42b034" />Secrets in k8s:
===============
✦ **Secrets** are used to store **sensitive information like passwords or keys**. They are similar to **configMaps**, except that they are stored in an encoded or hashed format. <br/> <br/>
<img width="272" height="199" alt="image" src="https://github.com/user-attachments/assets/397c4a6a-1110-4b54-99fb-e60a54002426" /> <br/> <br/>
✦ As configMaps, there are two steps involved in working with secrets. <img width="190" height="34" alt="image" src="https://github.com/user-attachments/assets/3dce5026-6c39-4ce2-80d3-68cd359398be" /> <br/>
✦ There are two ways of creating a secret. <br/> <br/>
<img width="349" height="68" alt="image" src="https://github.com/user-attachments/assets/0cb193d7-08ca-4a48-808e-291d36175456" /> <br/> <br/>
**1. Imperative:** <br/> <br>
<img width="371" height="155" alt="image" src="https://github.com/user-attachments/assets/dca142d6-8199-4772-93b2-3a8ed7f62d4f" /> <br/><br/>
󠁯•󠁏󠁏 Another way to input the secret data is through a file. <br/> <br/>
<img width="220" height="83" alt="image" src="https://github.com/user-attachments/assets/06e7435f-47f7-4087-9842-5f973f9fd524" /> <br/> <br/>
**2. Declarative:** <br/>
•󠁏󠁏 We can also create Secrets using **Secret YAML definition file.** <br/> <br/>
<img width="354" height="220" alt="image" src="https://github.com/user-attachments/assets/3099d652-8fa3-46f6-9da6-de90e11ea2ca" /> <br/> <br/>
⚠️ But while creating Secret with Declarative approach, we cannot put data values in **plain text**. We must specify the secret values in a **Hashed Format.** <br/> <br/>
 <img width="353" height="222" alt="image" src="https://github.com/user-attachments/assets/bb4ab157-e52f-47ad-913d-24b3db0bbd24" /> <br/> <br/>
✷ How do we convert the data from plain text to an **encoded format?** <br/> <br/>
<img width="344" height="122" alt="image" src="https://github.com/user-attachments/assets/e1c3a7a3-1dee-4c3a-851c-6b3e405a7750" /> <br/> <br/> 
➜ Run **echo -n "mysql" | base64** <br/> <br/>
<img width="343" height="191" alt="image" src="https://github.com/user-attachments/assets/e8d0c2d8-ab76-4914-bfa2-2f39e7e67e2c" /> <br/> <br/>
✷ Decoding the Hashed Values. <br/><br/>
<img width="337" height="103" alt="image" src="https://github.com/user-attachments/assets/c42e157e-3fd5-49a3-aaf5-ce39c564fc3a" /> <br/> <br/>
✦ **Secrets in Pods** <br/> <br/>
<img width="380" height="189" alt="image" src="https://github.com/user-attachments/assets/208c04cd-c892-4f30-bb6f-9606d2963ad9" /> <br/> <br/>
✦ We can also inject single environment variable in Pod definition. <br/> <br/>
<img width="349" height="102" alt="image" src="https://github.com/user-attachments/assets/a632fafa-9e69-4222-bca1-59fd49ad831e" /> <br/> <br/>









