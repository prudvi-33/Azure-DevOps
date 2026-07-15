✅ Let's see on pod to node relationship and **how you can restrict what pods are places on what nodes**. <br/>
⬩➤ Taints and Tolerations are used to **set restrictions on what pods can be scheduled on a node**. <br/>
⬩➤ Remember, **Taints are set on nodes** and **tolerations are set on pods.** <br/> <br/>

**kubectl taint nodes node1 app = blue: NoSchedule** <br/> <br/>
There are **three taint effects:** <br/> <br/>
▸ **NoSchedule** : Which means the pods will not be scheduled on the node. <br/>
▸ **PreferNoSchedule** : Means the system will try to avoid placing a pod on the node, but that's not guaranteed. <br/>
▸ **NoExecute**: Means New Pods will not be scheduled on the node and existing pods on the node, if any will be evicted if they do not tolerate the taint. <br/> <br/>

**Tolerations are added to Pods:** <br/> 
<img width="155" height="130" alt="image" src="https://github.com/user-attachments/assets/cb079d91-4818-4b7e-95d6-dde901083953" /> <br/> <br/>

