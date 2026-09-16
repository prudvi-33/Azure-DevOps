**Network namespaces (netns)** are the core technology that Kubernetes uses to isolate network traffic for pods and containers. <br/>
When you run a pod, **Kubernetes** uses **Linux network namespaces** behind the scenes to give that **pod its own private network stack.** <br/>

**Why do we need Network Namespaces?** <br/> <br/>
In a **standard Linux operating system**, there is only **one default network stack.**
This means all processes **share the same routing table**, the **same firewall rules (iptables)**, and **the same network interfaces (like eth0)**. <br/>
