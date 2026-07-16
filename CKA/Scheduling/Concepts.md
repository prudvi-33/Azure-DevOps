✅ **ManualScheduling** - By manually adding **nodeName** in Pod/Deployment definition/manifest file to schedule a Pod/Deployment **Manually.** <br/>
✅ **Labels and Selectors** -  we add selector to **filter/matchLabels** the labels we provide in **pod/deployment definition file.** <br/>
✅ **Taints and Tolerations** - Taints and Tolerations are used to **set restrictions on what pods can be scheduled on a node**. Taints and Tolerations are only meant to restrict nodes from accepting certain pods.
✅ **NodeSelector** - A **nodeSelector** is the simplest way to constrain **Kubernetes Pods to run only on specific Nodes**. It works through **key-value** pairs defined in your Pod specification, matching labels applied directly to your nodes. <br/>

📌 How It Works (The Mechanics): <br/>
1. Label the Node: You assign a **label** to your specific nodes (e.g., **hardware-type: gpu**).
2. Configure the Pod: You add a **nodeSelector** field in your **Pod configuration matching that exact key-value pair.**
3. The Result: The **Kubernetes scheduler** will only place that **Pod on a node that has the matching label**. If no such node is available, the Pod remains in a Pending state. <br/>

<img width="345" height="344" alt="image" src="https://github.com/user-attachments/assets/505eef3a-1ae8-4538-90f8-7abd8cd965c7" /> <br/>
✅ **Node-Affinity:** This has advanced features than nodeSelector.

