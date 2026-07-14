📌 **Kube-controller** manager manages various controllers in kubernetes. <br/>

➤ The **node-controller** is responsible for monitoring the status of the nodes and taking necessary actions to keep the applications running. It does that through Kube-API Server. <br/>
➤ **Replication-controller** is responsible for monitoring the status of replicasets, and ensuring that desired number of pods are available at all the times within the set. If a pod dies, it creates another one. <br/>

Now how do you see these controllers and where are they located in your cluster?
=================================================================================
➤ They all are packaged into a single process known as **Kubernetes controller manager.** <br/>
➤ When you install the kubernetes controller manager, the different controllers gets installed as well. <br/>
