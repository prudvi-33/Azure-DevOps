ETCD:
=====

✦ **etcd** default port is **2379** for client requests, and **2380** for peer communication. <br/>
✦ **etcd** is the primary, highly available **key-value** store used as the **backing database** for all **Kubernetes cluster** data. <br/>
✦ It stores information regarding the cluster such as nodes,pods,configs, secrets, roles, bindings etc <br/>

📌 Every information you see when you run **kubectl get** command is from **etcd** server. <br/>
📌 Every Change you make to your cluster, such as adding additional nodes, deploying pods, or replicas are updated in **etcd** server. <br/>
