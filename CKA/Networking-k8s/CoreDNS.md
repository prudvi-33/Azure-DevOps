<img width="401" height="185" alt="image" src="https://github.com/user-attachments/assets/e35b5e83-dada-4159-a04d-b0357df4bc62" />How k8s implements/setup CoreDNS in the cluster:
================================================
➔ The **DNS Server** is deployed as a **pod** in **kube-system** namespace in the **kubernetes cluster**.
➔ They are deployed as **two pods** for redundancy as a part of a **replicaset.** <br/> <br/>
<img width="254" height="178" alt="image" src="https://github.com/user-attachments/assets/1df35965-2bfd-4177-a92b-cf29348374c4" /> <br/><br/>
**/etc/resolv.conf** file is known as configuration file for DNS Queries.
✅ coreDNS Pod runs coreDNS Executable file. CoreDNS requires a configuration file. The file is  **/etc/coredns/Corefile** <br/> <br/>
<img width="344" height="203" alt="image" src="https://github.com/user-attachments/assets/a6f27ec7-f17d-4e06-a03d-196c1610db94" /> <br/><br/>
▶ The plugin that makes **coreDNS** work with kubernetes is the **Kubernetes Plugin** shown in above pic, and that is where the top level domain name of the cluster is set. In this case **cluster.local** <br/>
▶ This corefile is passed into the pod as a configmap object. <br/> <br/>
<img width="353" height="255" alt="image" src="https://github.com/user-attachments/assets/3a1bc1ac-6a14-4cad-b631-0a8acbd6c775" /> <br/> <br/>
#️⃣ So, If you need to modify this configuration, you can edit the **configmap object**. <br/>
⦿ We've now the coreDNS pod up and running using the appropriate Kubernetes Plugin. 
⦿ It watches the Kubernetes cluster for new pods and services, and every time a pod or service is created, it adds a record in its database. <br/><br/>
<img width="401" height="185" alt="image" src="https://github.com/user-attachments/assets/3b03e284-065e-4a33-8590-9e86799a8fe9" /> <br/> <br/>
⦿ Now pointing the pods to the coreDNS Server, what address do the pods use to reach the DNS Server? <br/>
⦿ **When we deploy the DNS Solution, it also creates a service to make it available to other components within the cluster.**. The service name is Kube-DNS by default. 
⦿ The DNS Configurations on Pod are done automatically when the pods are created. <br/>
⦿ The component which is responsible for that is "kubelet" <br/>
⦿ If you look at config file of the kubelet, you will see IP of the DNS Server and domain in it. <br/> <br/>
<img width="532" height="269" alt="image" src="https://github.com/user-attachments/assets/262a7037-c8b7-48f7-ac5f-7f20540245b1" /> <br/> <br/>





