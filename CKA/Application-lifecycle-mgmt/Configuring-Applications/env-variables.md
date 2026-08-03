▸ To set an Environment variable, we use **env** property. <br/> 
▸ **env** is an array, so **every item under the env property starts with a - indicating an item array.** <br/>
▸ Each item has a **name** and **value** property. <br/>
▸ The **name** is the name of the env variable made available with the container, and the **value** is it's value. <br/> <br/>

<img width="277" height="225" alt="image" src="https://github.com/user-attachments/assets/078bc033-1539-4740-8859-0773bbc704f4" /> <br/> <br/>

Configmaps in K8s:
==================
▸ ConfigMaps are used to pass configuration data in the form of key-value pairs in kubernetes. <br/> 
▸ During the pod/deployment creation, inject the **configmap into the pod** so the key-value pairs are available as environment variables for the application hosted inside the container in the pod. <br/> <br/>
<img width="416" height="200" alt="image" src="https://github.com/user-attachments/assets/a7bb8fe4-7f72-4a77-9006-dfed0ac6d3ef" /> <br/> <br/>

There are two phases involved in configuring **ConfigMaps**<br/>
1. Create the configMap and
2. Inject them into the pod. <br/> <br/>
<img width="347" height="183" alt="image" src="https://github.com/user-attachments/assets/428ac24f-4b9a-4d81-97eb-0b85c78218e6" /> <br/> <br/>
**Ways to create **configMap**:**  <br/>
1. **Imperative:** kubectl create configmap --from-literal="key"="value" <br/>
<img width="206" height="113" alt="image" src="https://github.com/user-attachments/assets/002391c8-cdd1-41fb-ae7a-33557f9b4c22" /> <br/> <br/>
⬩ **Another option is specifying the file path**: kubectl create configmap "config-name" --from-file=app_config.properties <br/>
2. **Declarative:** We create a definition file just like we do for other objects(pod, Deployment) <br/>
<img width="189" height="178" alt="image" src="https://github.com/user-attachments/assets/84c2198d-43b7-4363-830b-ffdbfc79d346" /> <br/> <br/>
3. **How do we inject the configmap into the pod definitition:** <br/>
<img width="379" height="158" alt="image" src="https://github.com/user-attachments/assets/47d1833e-5c23-4b64-9748-cae8d74f24d6" /> <br/>






