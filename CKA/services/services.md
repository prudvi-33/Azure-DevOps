📌 Services in k8s:
=====================
➤ Services provide stable, permanent IP address and DNS Name ensuring the Pods remain accessible, even as they are updated or scaled. Because Pods are ephemeral (they die and get recreated with new IP addresses). <br/>
➤ Kubernetes Service is an object just like pods, replicasets or deployments. <br/> <br/>

<img width="487" height="211" alt="image" src="https://github.com/user-attachments/assets/37a75f21-e95d-4f09-ae4e-93c7b854e127" /> <br/> <br/>

**ClusterIP Service:** <br/>

➤ A ClusterIP service will allow **internal communication to your Pod**. <br/> <br/>

<img width="656" height="305" alt="image" src="https://github.com/user-attachments/assets/83be994d-e87b-4123-861d-d0a2b8982637" /> <br/> <br/>

👉 If you are looking to set up a service that will allow you external access to your app, this is not the right choice for you. <br/>

**NodePort Service:** <br/>

➤ Exposes the **service on each Node’s IP** at a static port (30000–32767). <br/>
➤ A **NodePort service** opens a gateway for **external access to your cluster and web application**. <br/>
⤷ It operates by exposing a specific port at the node level within Kubernetes. Traffic hitting this node port is then forwarded to the corresponding service, which in turn routes it to your web application. <br/> <br/>

<img width="662" height="299" alt="image" src="https://github.com/user-attachments/assets/db213a63-b9b0-4630-9ba2-e48d6efd2d76" /> <br/> <br/>

<img width="490" height="208" alt="image" src="https://github.com/user-attachments/assets/ddeeae79-b95b-4a96-9041-601a54ea2346" /> <br/> <br/>

<img width="386" height="155" alt="image" src="https://github.com/user-attachments/assets/ecd65f36-a9be-44c5-9738-d2ee8723f8a2" /> <br/> <br/>

➤ The **port on the Pod** is where the actual web server is running is 80, and it is referred to as the target port, because that is where the service forwards the request to. <br/>
➤ The **second port** is on the service itself. It is simply refer to as a port. <br/>
➤ Finally, we have the **port on the node** itself which we use to access the web server externally. That's known as NodePort. <br/>
➤ NodePorts can only be in the **valid range**, which by default is from **30,000 to 32,767**. <br/>

             





















