📌 Resource Requirements: 
=========================
<img width="245" height="58" alt="image" src="https://github.com/user-attachments/assets/22cccee1-d0d4-4d46-bd13-d33058283f67" /> <br/> <br/>
➤ Every Pod requires set of resources to run. <br/>
➤ Example, We have a pod 📦 requires two CPU's and 1 Memory. <br/>
➤ Now, whenever a pod is placed on a node, it consumes the resources available on that node. <br/> <br/>
<img width="149" height="151" alt="image" src="https://github.com/user-attachments/assets/20525f2e-d792-4c06-835b-90c54756e78c" /> <br/>
👉 As we know, it is the **k8s scheduler that decides which node a pod goes**. <img width="134" height="37" alt="image" src="https://github.com/user-attachments/assets/5cc5b913-6516-40d7-88fd-74b8031c7399" /> <br/>
➤ The scheduler takes into consideration **the amount of resources required by a pod** and **those available on the nodes**, and identifies **the best node to place a pod on**. <br/>
➤ If **nodes have no sufficient resources** available, then **scheduler avoids placing the pod on those nodes** and you will see the **pod in pending state.** instead it **places the pod on one where sufficient resources are available**. <br/>
<img width="353" height="57" alt="image" src="https://github.com/user-attachments/assets/1e7e3566-3112-4e5e-90a5-0320df560fb6" /> <br/> <br/>

Let's focus on the **resource requirements for each pod**: <br/> <br/>
<img width="245" height="58" alt="image" src="https://github.com/user-attachments/assets/d3cec4ca-0b9a-4f43-bfe0-d084845735b2" /> <br/>
➤ We specifiy **the amount of CPU and memory required for Pod** when creating one. <br/>
✦ Example, it could be **1 CPU and 1 GB of memory** and this is known as **resource Request for a container**. So the **minimum amount of CPU and memory requested by the container.** <br/>
<img width="287" height="182" alt="image" src="https://github.com/user-attachments/assets/aa4c1d46-75b7-4435-a08e-1b639c9fd773" /> <br/>
✔ So when the scheduler tries to place the pod on a node, it uses these numbers to identify a node which has sufficient amount of resources available. <br/>
<img width="402" height="201" alt="image" src="https://github.com/user-attachments/assets/4309e127-87d0-4881-b1a4-7b35a19386c1" /> <br/>
➤ And when the pod gets placed on a node, **the pod gets guranteed amount of resources available** for it. <br/> <br/>
➤ So the container's running on a node, and by default, a acontainer has no **limit** to the resources it can consume on a node. <br/>
➤ So, you can set a limit for resource usage on these pods. <br/>
<img width="160" height="206" alt="image" src="https://github.com/user-attachments/assets/a8adc06e-86f5-4f29-8761-d70bbd24583b" /> <br/>
✦ Example, you can set a **limit of 512 MB** on containers. <br/>
<img width="422" height="233" alt="image" src="https://github.com/user-attachments/assets/f8d39aa9-9ae2-4d83-9db4-250b44bf8199" /> <br/>
➤ Now when the pod is created, **kubernetes sets limits** for the container. <br/> <br/>
📌 Main point is **requests and limits are set for each container within a pod**. So if there are multiple containers, then each container can have a request or limit set for its own. <br/>






 
