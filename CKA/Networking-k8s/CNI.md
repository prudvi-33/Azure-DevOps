How do you configure these container runtimes to use a particular plugin? <br/> <br/>
<img width="315" height="215" alt="image" src="https://github.com/user-attachments/assets/1202fbed-397d-4275-89ad-caa06613040a" /> <br/> <br/>
1. Network plugins are installed in the directory **/opt/cni/bin** - This is the path where container runtimes finds the plugins.
2. But which plugin to use and how to use it is configured in the directory **/etc/cni/net.d** <br/> <br/>
<img width="347" height="227" alt="image" src="https://github.com/user-attachments/assets/53032a53-3907-4955-8a4b-63d3187b10d8" />
