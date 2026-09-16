Commands to note:
==================
1. **ip link** - To list and modify interfaces on the host.<br/>
2. **ip addr** - To see IP addresses assigned to those interfaces. <br/>
3. **ip addr add 192.168.1.10/24 dev eth0** - IP Addr Add command is used to set IP Addresses on the interfaces. <br/>
4. **ip route** - Is used to view the Routing table. <br/>
5. **ip route add 192.168.1.0/24 via 192.168.2.1(through routerIP)** - Is used to add entries into the routing table. <br/> <br/>

Every host has a DNS Host Configuration file at **etc/resolv.conf**

Pod Networking:
===============
Kubernetes has laid out clearly the requirements for pod networking. <br/><br/>
1. Kubernetes expects every pod to get its own IP Address.
2. **Every POD** Should be able to communicate with **every other POD** in the **same node**.
3. **Every POD** Should be able to communicate with **every other POD** on **other nodes** without NAT. <br/><br/>
<img width="433" height="257" alt="image" src="https://github.com/user-attachments/assets/afaaad1b-d9f0-4560-9480-e827e934deda" /> <br/> <br/>
It doesn't care what IP address that is and what range or subnet it belongs to. As long as you can implement a solution that takes care of a**utomatically assigning IP addresses** and **establish connectivity** between **the pods in a node** as well as **pods on different nodes**, you're good. <br/> <br/>


having to configure any Nat rules.

