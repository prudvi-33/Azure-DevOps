🗨 **Kubelet** in the kubernetes worker node **registers the node with the kubernetes cluster.** <br/>
🗨 When **Kubelet** receives instructions from **kube-scheduler ➝ kube-API Server** to load a container or pod on the node, it requests container-runtime engine(containerd), to pull the required image and run an instance (pod). <br/>
🗨 The **Kubelet** then continues to monitor the state of the pod and containers in it, and reports to the kube-API server on a timely basis. <br/> <br/>

<img width="494" height="252" alt="image" src="https://github.com/user-attachments/assets/0b8152cf-900a-4b97-a0bf-12a04ff4c8de" />

