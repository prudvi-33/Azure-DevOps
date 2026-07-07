Kube-scheduler:
===============

📌 **Kube-scheduler** is responsible for **scheduling pods and nodes**. The scheduler is responsible for **deciding** which pod goes on which node. <br/>
📌 It doesn't actually place the pods on the nodes. That's the job of the **kubelet.** <br/>
📌 The **scheduler** only decides which pod goes where. <br/> <br/>
📌 In k8s, the **scheduler** decides **which nodes the pods are placed on**. Depending on certain criteria, you may have **pods with different resource requirements**. You can have** nodes in the cluster dedicated to certain applications.** <br/>

So how does the scheduler assign these pods:
==============================================

📌 The scheduler looks at each pod and tries to find the best node for it. <br/>

Example:
========
✦ Lets take **one pod** as an example. It has set of CPU and Memory requirements. <br/>
✦ The scheduler goes through **two phases** to identify the **best node** for a pod. <br/>
⤿ In the first phase, the scheduler tries to filter out the nodes that do not fit the profile for this pod. Example, **the nodes that does not have sufficient CPU and memory resources requested by the pod.** <br/>
⤿ The scheduler **ranks the nodes** to identify the best fit for the pod. <br/>
⤿ It uses priority function to assign a score to the nodes on scale of 0 to 10. <br/>
⤿ Here, the scheduler calculates the amount of resources that would be free on the nodes after placing the pod on them. <br/>

That's how the scheduler works at high level................. <br/>
