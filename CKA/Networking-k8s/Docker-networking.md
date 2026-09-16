**Network namespaces (netns)** are the core technology that Kubernetes uses to isolate network traffic for pods and containers. <br/>
When you run a pod, **Kubernetes** uses **Linux network namespaces** behind the scenes to give that **pod its own private network stack.** <br/>

**Why do we need Network Namespaces?** <br/> <br/>
In a **standard Linux operating system**, there is only **one default network stack.**
This means all processes **share the same routing table**, the **same firewall rules (iptables)**, and **the same network interfaces (like eth0)**. <br/>
The problem is **no isolation**. Every application can see and freely intercept the network traffic of every other application running on that same machine. <br/> <br/>
<img width="383" height="212" alt="image" src="https://github.com/user-attachments/assets/2cc55ab9-8755-4873-8e2d-f29474efa262" /> <br/> <br/>
When you run a container, you have different networking options to choose from. <br/>
**1. None network:** <br/> <br/>
With **None network**, **docker container** is not attached to any network. The container cannot reach the outside world, and no one from the outside world can reach the container. <br/>
If you **run multiple containers**, they are all **created without being part of any network** and **cannot talk to each other or to the outside world.** <br/> <br/>
<img width="368" height="220" alt="image" src="https://github.com/user-attachments/assets/7d5e49a7-a264-4267-a6ac-af3b73f72d06" />
2. **Host Network:** <br/> <br/>
With the host network, the container is attached to the host's network. There is **no network isolation between the host and the container.** <br/>
If you deploy a web application listening on port 80 in the container. Then the **web application is available on port 80** on the **host without having to do any additional portmapping.** <br/> <br/>
<img width="429" height="239" alt="image" src="https://github.com/user-attachments/assets/da78918f-6ff9-428a-9db8-63217f77446f" /> <br/> <br/>
If you try to run another instance of the same container that listens on the same port, **it won't work as they share the host networking and two processes cannot listen on the same port at the same time.** <br/>
3. **Bridge Network:** <br/> <br/>
In this case, an internal private network is created which the Docker host and containers attached to. <br/> 
The network has an address **172.17.0.0** by default, and each device connecting to this network get their own internal private network address on this network. <br/> <br/>
<img width="376" height="218" alt="image" src="https://github.com/user-attachments/assets/1e157481-3479-4a6a-8cd7-61a0874ffd36" /> <br/> <br/>
**Let's take a deeper look:** <br/> <br/>
When Docker is installed on the host, it creates an **internal private network called bridge by default**. <br/> <br/>
<img width="344" height="206" alt="image" src="https://github.com/user-attachments/assets/02a82b06-61f2-4b72-a11c-248a3bf1163e" /> <br/><br/>
Docker calls the network by the name, but on the **host**, the network is created by the **docker0** <br/> <br/>
<img width="478" height="206" alt="image" src="https://github.com/user-attachments/assets/18dd309e-7fae-47a8-9087-1d9051acc6ea" /> <br/><br/>
Whenever a **container** is created, Docker creates a **network namespace** for it. We can check by running **ip netns** command that shows namespace. <br/><br/>
<img width="488" height="203" alt="image" src="https://github.com/user-attachments/assets/be0c68ba-9e4b-410c-bf34-89dbce934f36" /> <br/> <br/>
**So, How does Docker attach the container to the** **bridge network** ? <br/><br/>
Docker creates a namespace, creates a pair of interfaces, attaches one end to the container, and another end to the bridge network. <br/><br/>
<img width="302" height="269" alt="image" src="https://github.com/user-attachments/assets/feb8d6b6-4b86-4627-bac2-922da78c1b94" /> <br/> <br/>
**Let us look at the port mapping now:** <br/> <br/>
If you try to access the web page using curl with the IP of the container from within Docker host on port 80, you will see the web page. Fine. <br/>
But If you try to do the same thing outside the host, you cannot view the web page. <br/> <br/>
<img width="470" height="260" alt="image" src="https://github.com/user-attachments/assets/3a8ee323-099c-4f36-82a9-cffd25c5ca51" /> <br/> <br/>
To allow external users to access the applications hosted on containers. Docker provides a **port publishing or port mapping option**. <br/>
When you run containers, tell Docker to **map port 8080 on the Docker host to port 80 on the container.** <br/>
With that done, you could **access the web application using the IP of the Docker host and port 8080.** <br/>
Any traffic to port 8080 on the docker host will be forwarded to port 80 on the container. <br/>
<img width="488" height="260" alt="image" src="https://github.com/user-attachments/assets/06137977-8ba3-47b9-997c-2c2a5cdf440e" /> <br/> <br/>
Now all of your external users and other applications or service can use this URL to access the application deployed on the host. 









