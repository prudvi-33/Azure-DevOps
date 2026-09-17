✅ **CNI** defines the **responsibilities of container runtime**. As per CNI, **container runtimes** are responsible for **creating network namespaces**, identifying and attaching those namespaces to the right network by calling the right network plugin. <br/> <br/>
So where do we specify the CNI for kubernetes to use ? <br/><br/>
✅ The CNI plugin must be involved by the component within the kubernetes that is responsible for creating containers, because that component must then invoke the appropriate network plugin after the container is created.
✅ The component that is responsible for creating containers is the container runtime. The two good examples are **container-D** and **cri-o** <br/> <br/>
<img width="253" height="90" alt="image" src="https://github.com/user-attachments/assets/8ea351b2-9da9-4984-b5be-53af77c2794a" /> <br/><br/>

How do you configure these container runtimes to use a particular plugin? <br/> <br/>
<img width="315" height="215" alt="image" src="https://github.com/user-attachments/assets/1202fbed-397d-4275-89ad-caa06613040a" /> <br/> <br/>
1. Network plugins are installed in the directory **/opt/cni/bin** - This is the path where container runtimes finds the plugins.
2. But which plugin to use and how to use it is configured in the directory **/etc/cni/net.d** <br/> <br/>
<img width="347" height="227" alt="image" src="https://github.com/user-attachments/assets/53032a53-3907-4955-8a4b-63d3187b10d8" />
