✦ **The Purpose of **kubernetes** :** is to host your applications in the form of **containers**,  so that you can easily deploy **as many instances of your application as required**, and easily enable communication between different services within your application. <br/>

⤷ The **Kubernetes Cluster** consists of a **set of nodes**, which may be **physical** or **virtual**, **on-premise** or on **Cloud**, that **hosts application in form of containers**.

📌 **Worker Nodes**: Hosts applications as **Containers**. <br/>
📌 **Master Node** is responsible for managing the kubernetes cluster, storing information regarding the different nodes, planning which containers goes where, etc. <br/>
📌 **Master Node** does all of these using set of components together known as the **control plane components.** <br/> <br/>
                                              ── ⋆⋅☆⋅⋆ ──  <br/>
<br/> ➺ **Etcd**: Etcd is a database that stores information in a key value format. <br/>
➺ **Scheduler**: Scheduler identifies the **right node** to place a **container** on based on **container resource requirements**, the **worker nodes capacity**, or any other policies/constraints such as **taints and tolerations** or **node affinity rules** that are on them. <br/>
➺ **Node controller**  takes care of nodes. They are responsible for **onboarding new nodes** to the **cluster**, handling situation where nodes become unavailable. <br/>
➺ **Replication controller** ensures that the desired number of containers are running at all times in a replication group. <br/>
➺📌 <br/>
⤷ **Kube-API server** is the primary management component of kubernetes. <br/>
⤷ **Kube-API server**  is responsible for orchestrating all operations within the cluster. <br/>
⤷ It exposes kubernetes API, which is used by external users to perform management operations on the cluster, as well as the various controllers to monitor the state of the cluster and make necessary changes as required by the worker nodes to communicate with the server. <br/>
⤷ **Kube-API server** periodically fetches status reports from the kubelet to monitor the status of the nodes and containers on them. <br/>
➺ **Kubelet** is an agent that runs on **each node** in a cluster. It listens for instructions from the **KubeAPI server** and deploys or destroys containers on the nodes as required. <br/>
➺ **Kube-proxy** that helps in **enabling communication** between the services within the cluster. <br/> <br/>


📌 **Container Runtime Interface (CRI)** is a **standardized plugin API** that allows Kubernetes to communicate with different container runtimes without needing to recompile the cluster components. <br/>
📌 You need a **working container runtime** on **each Node** in your **cluster**, so that the **kubelet** can launch Pods and their containers. <br/>

Container-d Runtime:
====================

👉 **containerd** (pronounced container-dee) is an industry-standard, open-source **container runtime** that manages the complete lifecycle of containers on a host system(Kubernetes worker node).  <br/>

What Exactly Does containerd Do?
==================================
👉 Acting as the engine on **each worker node**, **containerd** operates under the hood to perform several core tasks: <br/>

✦︎ **Image Management**: It pulls container images from remote registries (like Docker Hub) and caches them locally. <br/>
✦︎ **Execution & Lifecycle**: It starts, pauses, stops, and destroys container processes. <br/>


Flow of Creating a k8s objects(pods,deployments etc) using architecture:
==========================================================================
📌 Let's look an example of creating a pod. 
============================================
↳ Firstly, the API server checks the request is authenticated and then validated. <br/>
↳ Here, Now, The API Server creates a Pod object internally and saves this desired state to etcd (Kubernetes' database of truth) without assigning it to a node. Updates information in the etcd server. Updates the User that Pod has been created. <br/>
↳ The scheduler continously monitors the API Server and realizes that there is a new pod with no node assigned.It evaluates your cluster nodes and assigns the pod to an appropriate worker node.<br/>
↳ The scheduler assigns the right node to place the new pod and communicates that back to the API Server, which then writes this updated pod-to-node binding into etcd <br/>
↳ The API Server then updates the information to the etcd server. <br/>
↳ The API Server then passes that information to the kubelet in the appropriate worker node. <br/>
↳ The kubelet(agent on the assigned worker node) then creates Pod on the node and instructs container runtime engine to deploy the application image.(containers) <br/>
↳ Once done, the kubelet updates the status back to the API Server, and the API Server then updates the information back to the etcd server(cluster) <br/>

📌 Imp note:
==================
Within the kubernetes cluster, **every pod can reach every other pod.** This is accomplished by deploying a **pod networking** solution to the cluster. <br/>
A pod network is internal virtual network that spans across all the nodes in the cluster, to which all the pods connect to. <br/>
Through this network, they're able to communicate with each other. <br/>
