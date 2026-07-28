📌 **Admission controllers:** <br/>
➤ So we've been running commands from our command line using the **kubectl utility** to perform various **kinds of operations** on our **Kubernetes cluster**. And we know every time we send a request say to create a pod, 
the request goes to the **API server**. <br/>
➤ And then the **pod is created** and the information is finally persisted in the **etcd database**. <br/>
👉 When the request hits the API server, we've learned that it goes through an **authentication process**, and this is usually done through **certificates**. <br/> <br/>
<img width="519" height="254" alt="image" src="https://github.com/user-attachments/assets/4fc86a2f-a3a0-4007-b571-619d085dfda2" /> <br/> <br/>
➤ If the request was sent through **kubectl**, we know the **kube config file has the certificates configured**, and the authentication process is responsible for identifying the user **who sent the request and making
sure the user is valid**. <br/>
👉 And then the request goes through an **authorization** process. And this is when we check if the **user has permission to perform that operation**. This is achieved through
**role based access controls.** <br/> <br/>
<img width="534" height="230" alt="image" src="https://github.com/user-attachments/assets/053e7f7f-ad81-498a-b85f-cf506e9b81f1" /> <br/> <br/>
👉 So in this case, if the user was assigned this particular role of a developer, the user is allowed to list, get, create, update or delete pods. And so if the request that came in matched any of these conditions, it is allowed to go through.
Otherwise it's rejected. So that's authorization with role based access control. <br/>
📌 Now, as you can see, most of these rules that you can create with role based access control is at the Kubernetes API level like what user is allowed access to what kind of API operations and it does not go beyond that. <br/>
**But what if you want to do more than just define what kind of access a user has to an object?** <br/>
For example, **when a pod creation request comes in, you'd like to review the configuration file and
look at the image name and say that you do not want to allow images from a public Docker Hub registry.** <br/> <br/>
<img width="440" height="187" alt="image" src="https://github.com/user-attachments/assets/0a85ab4c-c1f5-4a41-8bf5-0456c4aa6d10" /> <br/ ><br/>

📌 **This is where Admission controllers comes in:** <br/> <br/>
<img width="516" height="160" alt="image" src="https://github.com/user-attachments/assets/9954b756-a0b0-4a20-8196-5ee6b7f85efa" /> <br/> <br/>
1. Admission controllers help us **implement better security measures** to enforce how a cluster is used. <br/>
2. Apart from simply validating configuration, admission controllers can do a lot more, such as **change the request itself or perform additional operations before the pod gets created.** <br/>
 <br/>
**Few admission controllers and their uses:** <br/>
============================================
1. AlwaysPullImages - It ensures everytime a pod is created, the images are always pulled. <br/>
2. DefaultStorageClass - The **default storage class admission controller** that observes the creation of PVCs and automatically adds the default storage class to them if one is not specified. <br/>
3. EventRateLimit - The **event rate limit admission controller** can help set a **limit on the requests with the the API server can handle at a time**. To prevent the API server from flooding with requests. <br/> <br/>
4. NamespaceLifecycle - NamespaceLifecycle acts as a strict validation gatekeeper that executes three rules:
   ✦ Rejects missing namespaces (The old NamespaceExists behavior): If you run a command targeting a namespace that doesn't exist, it blocks it. <br/>
   ✦ Rejects terminating namespaces: If **a namespace is currently being deleted, it blocks you from adding any new pods or services inside it.** <br/>
   ✦ Protects system namespaces: It completely **blocks anyone from running kubectl delete ns kube-system, default, or kube-public.** <br/>
<img width="452" height="173" alt="image" src="https://github.com/user-attachments/assets/27613e4a-33fb-46a9-b8de-5e37e391f47e" /> <br/> <br/>

**How we can enable/disable Admission Controllers:** <br/> <br/>
➤ To enable or disable admission controllers in a standard production cluster (like the one in the CKA exam), you must modify the static pod manifest for the **kube-apiserver**. <br/>
➤ Because it is a **static pod**, saving changes to this file causes the kubelet to automatically restart the API server with your new configurations. <br/>
**Step 1**: Access the Master/Control-Plane Node. <br/>
▸ All core Kubernetes control plane components run as static pods on the control-plane node. <br/>
**ssh control-plane-node** <br/>
**Step 2:** Navigate to the Manifests Directory.
▸ The default location for all static pod manifests is **/etc/kubernetes/manifests/.** 
**cd /etc/kubernetes/manifests/** <br/>
**Step 3**: Edit the Manifest File. <br/>
Open the file using vim or nano with administrative privileges. <br/>
**sudo vi kube-apiserver.yaml** <br/>
**Step 4**: Modify the Admission Control Flags. <br/> <br/>
<img width="347" height="307" alt="image" src="https://github.com/user-attachments/assets/86ddead4-071e-4f53-8865-244feb84cf9d" /> <br/> <br/>
**Step 5**: Wait for the API Server to Restart. <br/>
The kubelet watches this directory. The moment you save the file, it terminates the old container and starts a new one. This process takes about 30 to 60 seconds. <br/>





