✅ **Kube-DNS** is the legacy built-in DNS service for Kubernetes that provides **internal service discovery** by translating **service** and **pod names** into **IP addresses**. <br/>
✅ It is replaced by **CoreDNS** as the default DNS provider starting in **Kubernetes v1.13** <br/>
✅ Kubernetes deploys a built-in DNS Server by default when you setup a cluster. <br/> <br/>
<img width="407" height="214" alt="image" src="https://github.com/user-attachments/assets/68a56807-0168-492b-be46-a11de4bc5426" /> <br/> <br/>
<img width="407" height="206" alt="image" src="https://github.com/user-attachments/assets/de8b1442-26cd-4515-8a64-7899b1ae67f3" /> <br/> <br/>
✅ From the above picture, let us say we have two pods in two different nodes. To make web server accessible to the test pod, we create a service named "web-service". <br/>
➔ Whenever a service is created, the **Kubernetes DNS** service creates a record for the service. It maps service name to the IP Address. <br/>
➔ So within the cluster, any pod can now reach this service using its service name. <br/> <br/>
<img width="389" height="251" alt="image" src="https://github.com/user-attachments/assets/ce8401cc-5fec-4fb0-86e1-903edf8e36dd" /> <br/> <br/>
<img width="532" height="245" alt="image" src="https://github.com/user-attachments/assets/1c4e0904-329a-4c51-8f59-981026ad29b7" /> <br/> <br/>
⚫ syntax for fully qualified Domain name **FQDN = servicename.namespace.svc.cluster.local**



