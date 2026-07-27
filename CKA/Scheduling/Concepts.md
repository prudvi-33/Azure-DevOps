✅ **ManualScheduling** - By manually adding **nodeName** in Pod/Deployment definition/manifest file to schedule a Pod/Deployment **Manually.** <br/>
✅ **Labels and Selectors** -  we add selector to **filter/matchLabels** the labels we provide in **pod/deployment definition file.** <br/>
✅ **Taints and Tolerations** - Taints and Tolerations are used to **set restrictions on what pods can be scheduled on a node**. Taints and Tolerations are only meant to restrict nodes from accepting certain pods. <br/>
✅ **NodeSelector** - A **nodeSelector** is the simplest way to constrain **Kubernetes Pods to run only on specific Nodes**. It works through **key-value** pairs defined in your Pod specification, matching labels applied directly to your nodes. <br/>

📌 How It Works (The Mechanics): <br/>
1. Label the Node: You assign a **label** to your specific nodes (e.g., **hardware-type: gpu**).
2. Configure the Pod: You add a **nodeSelector** field in your **Pod configuration matching that exact key-value pair.**
3. The Result: The **Kubernetes scheduler** will only place that **Pod on a node that has the matching label**. If no such node is available, the Pod remains in a Pending state. <br/>

<img width="345" height="344" alt="image" src="https://github.com/user-attachments/assets/505eef3a-1ae8-4538-90f8-7abd8cd965c7" /> <br/>
✅ **Node-Affinity:** This has advanced features than nodeSelector. <br/>
✅ **Static-Pods:** **/etc/kubernetes/manifests** - This is the directory location where static pod manifest files should be placed. <br/> <br/>
<img width="269" height="151" alt="image" src="https://github.com/user-attachments/assets/82dd7109-f236-403e-8777-4667b9528076" /> <br/> <br/>
✔ kubelet periodically checks this directory for files, reads these files, and creates pods on the host. <br/> <br/>
<img width="238" height="143" alt="image" src="https://github.com/user-attachments/assets/c8bdcbad-09ab-4f32-a9b6-6b9808563c6a" /> <br/><br/>
✔ Not only does it create the pod, it can ensure that the pod stays alive. If the application crashes, the kubelet attempts to restart it. <br/>
✔ If you make a change to any of the file within this directory, the kubelet recreates the pod for those changes to take effect. <br/>
✔ If you remove a file from this directory, the pod will be deleted automatically. <br/>
📌 So these pods that are created by kubelet on its own, without the intervention from the API Server or the rest of the kubernetes cluster components are known as **static pods.** <br/>
✅ **Priority Classes.** - Pods/Deployments with **high priority** scheduled first.<br/>
✅ **Multiple schedulers.** -  **Custom Schedulers** - **schedulerName** : **"CustomSchedulerName"** <br/>
✅ **Scheduler Profiles.** <br/> <br/>
<img width="477" height="218" alt="image" src="https://github.com/user-attachments/assets/3dfa1229-1642-4594-bb90-ed7ea6abed76" /> <br/> <br/>
📌 **Scheduling Blogs to learn(Must):**
1. https://github.com/kubernetes/community/blob/main/contributors/devel/sig-scheduling/scheduling_code_hierarchy_overview.md <br/>
2. https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/ <br/>
3. https://jvns.ca/blog/2017/07/27/how-does-the-kubernetes-scheduler-work/ <br/>




