We use **kubeadm tool** to setup **multi-node cluster** following the best **k8s practices**. <br/>
Let's go through the steps to set up the **kubernetes cluster** using **kubeadm tool** at a higher level. <br/><br/>
1. Firstly, you must have multiple systems or virtual machines provisioned for configuring the cluster.
2. Once the systems are created, Designate One node as master and others as worker nodes.
3. The next step is to **install a container runtime** on the hosts. We will be using **containerd.** So we must **install containerd** on all the nodes.
4. The next step is to install "**kubeadm**" tool on all nodes. The kubeadm tools helps us bootstrapping the k8s solution by installing and configuring all the required components in the right nodes, in the right order.
5. The next step is to **initialize the master server.** During this process, all the required components are installed and configured on the master server. Once the master is initialized, and before joining the worker nodes to the master, you must ensure that the network prerequisites are met.
6. K8s requires special networking for this, known as **Pod Networking.**
7. The last step is to join worker nodes to the master nodes. Then all set. <br/> <br/>
<img width="483" height="242" alt="image" src="https://github.com/user-attachments/assets/1dd50c12-adc6-4228-99e2-31cd9e8f7fd3" /> <br/> <br/>


Commands :
=========
1. **container config default**: to view **containerd** config file content.
2. **/etc/containerd/config.toml**: containerd configuration path.


