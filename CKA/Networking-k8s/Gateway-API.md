◆ Configuring **Gateway API** needs only three things: <br/>
1. GatewayClass
2. Gateway
3. HTTPRoute
◆ A **GatewayClass** defines a set of Gateways that are implemented by a specific controller. Think of it as a blueprint that tells Kubernetes which controller will manage the Gateways. <br/>
◆ A **Gateway** is a Kubernetes resource that defines how traffic enters your cluster. It specifies the protocols, ports, and routing rules for incoming traffic. <br/>
◆ An **HTTPRoute** defines how HTTP traffic is forwarded to Kubernetes services. It works in conjunction with a Gateway to route requests based on specific rules, such as matching paths or headers.<br/><br/>
<img width="508" height="225" alt="image" src="https://github.com/user-attachments/assets/a8e38b59-45d8-4cd7-bca1-bbc9c09c95a3" /> <br/> <br/>
