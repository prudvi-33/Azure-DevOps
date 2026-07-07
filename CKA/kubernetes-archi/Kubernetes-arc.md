✦ **The Purpose of **kubernetes** :** is to host your applications in the form of **containers**,  so that you can easily deploy **as many instances of your application as required**, and easily enable communication between different services within your application. <br/>

⤷ The **Kubernetes Cluster** consists of a **set of nodes**, which may be **physical** or **virtual**, **on-premise** or on **Cloud**, that **hosts application in form of containers**.

📌 **Worker Nodes**: Hosts applications as **Containers**. <br/>
📌 **Master Node** is responsible for managing the kubernetes cluster, storing information regarding the different nodes, planning which containers goes where, etc. <br/>
📌 **Master Node** does all of these using set of components together known as the **control plane components.** <br/>


                                              ── ⋆⋅☆⋅⋆ ── 

                                              
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
