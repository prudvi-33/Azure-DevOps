╰┈➤ Let's assume that the application is already developed and built into docker images, and it is available on Docker registry like Docker Hub, So k8s can pull it down. <br/>
╰┈➤ Here, Our ultimate aim is to deploy our application in the form of containers on a set of machines that are configures as worker nodes in a cluster. <br/>
╰┈➤ However, Kubernetes does not deploy containers directly on the worker nodes. <br/>
╰┈➤ The containers are encapsulated into a kubernetes object known as pods. <br/>

❝ A pod is a single instance of an application.❞ <br/>
❝ A pod is a smallest object that you can create in kubernetes.❞ <br/> 

<img width="400" height="248" alt="image" src="https://github.com/user-attachments/assets/f305bc8c-ec4b-4460-bd85-569d3ee41881" /> <br/> <br/>

**"kubectl run"** 
===================
➤ The **kubectl run command** is a quick way to create and run a specific application inside your Kubernetes cluster. <br/>
➤ It instructs Kubernetes to immediately spin up a Pod running the container image you specify. <br/>

**Syntax:** <br/>

kubectl run <pod-name> --image=<container-image> <br/>

**Example:** <br/>

kubectl run my-web-server --image=nginx <br/>

This instantly **creates a Pod** named **my-web-server** running the default Nginx image. <br/>
