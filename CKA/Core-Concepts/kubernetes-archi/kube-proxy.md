📌 *Kube-proxy:*
===================

⬩➤ Kube-proxy is a process that runs on each node in the kubernetes cluster. <br/> <br/>

<img width="403" height="234" alt="image" src="https://github.com/user-attachments/assets/140164ff-2204-457c-9500-ba69c3c5f55e" /> 

*Difference between kube-proxy and service in k8s*:
==================================================

A Clear Example: <br/> <br/>

Imagine you run an online store with a **frontend app** that needs to talk to a **backend payment API**. <br/>

**1. The Setup:** <br/>
✦︎ You deploy **3 identical payment Pods** for high availability. Kubernetes assigns them random, **temporary IP addresses**: <br/>
**Pod A: 10.244.1.5** <br/>
**Pod B: 10.244.2.8** <br/>
**Pod C: 10.244.1.9**. <br/>

**2. The Problem:** <br/>
✦︎ Your **frontend app** cannot hardcode these **three IPs**. If **Pod A crashes**, Kubernetes will replace it with a new Pod that has a **completely different IP address**. <br/>

**3. The Service Solution** <br/>
✦︎ To solve this, you create a **Service** named **payment-service**. Kubernetes gives this **service a permanent, virtual IP address: 10.96.0.100**. <br/>

**4.kube-proxy in Action** <br/>
✦︎ **kube-proxy** on every node notices this new Service. It opens the node's local Linux network configuration and writes a rule that says:

**"If any traffic hits the virtual IP 10.96.0.100, randomly pick one of these real IPs: 10.244.1.5, 10.244.2.8, or 10.244.1.9 and send the traffic there."** <br/> 

**5. The Traffic Flow** <br/>
✦︎ The frontend app sends a payment request to the Service IP: 10.96.0.100. <br/>
✦︎ The traffic hits the host node's network layer. <br/>
✦︎ The kernel looks at the rules written by kube-proxy. <br/>
✦︎ The kernel instantly changes the destination IP from 10.96.0.100 to Pod B's real IP (10.244.2.8). <br/>
✦︎ The payment request arrives safely at Pod B. <br/>

If Pod A dies and a new Pod D (10.244.3.12) takes its place, kube-proxy instantly updates the node's internal rules, removing Pod A and adding Pod D seamlessly without the frontend ever knowing anything changed. <br/>
