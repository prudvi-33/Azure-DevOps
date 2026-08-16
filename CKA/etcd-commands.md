1. **"cat /etc/*release"**- To get Linux package, version and distro all details. <br/>
2. **sudo apt-get update** - To update/upgrade the Ubuntu distro so that we can install the other softwares and packages. <br/>
3. **sudo apt-get install -y etcd-client** - To install **etcd** software. <br/>
4. **etcdctl --version** -  to check etcdctl version. <br/> <br/>
✅ Whenever we want to run commands or interact with etcd, We run <br/>
 **ETCDCTL_API=3 etcdctl snapshot ""** etc command. <br/>
⬩ But everytime to use ETCDCTL_API=3 will be burden. So we can give export **export ETCDCTL_API=3** , So from the next time, we can start command with starting **etcdctl** itself.
Example: **etcdctl snapshot ""** <br/> 
