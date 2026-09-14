Commands to note:
==================
1. **ip link** - To list and modify interfaces on the host.<br/>
2. **ip addr** - To see IP addresses assigned to those interfaces. <br/>
3. **ip addr add 192.168.1.10/24 dev eth0** - IP Addr Add command is used to set IP Addresses on the interfaces. <br/>
4. **ip route** - Is used to view the Routing table. <br/>
5. **ip route add 192.168.1.0/24 via 192.168.2.1(through routerIP)** - Is used to add entries into the routing table. <br/> <br/>

Every host has a DNS Host Configuration file at **etc/resolv.conf**
