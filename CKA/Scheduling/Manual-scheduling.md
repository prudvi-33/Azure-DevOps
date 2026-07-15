✅ --watch option:
===================

✦ It's used to monitor the realtime state/status while creation process of k8s objects like Pods, Deployments, Service, PVC etc.. <br/>
Example: **kubectl get pods --watch** <br/> <br/>

✦ All the control plane components like (coredns, etcd, kube-scheduler, kuber-apiserver etc) will be visible as pods in **kube-system** k8s-specific namespace. <br/>
Example: **kubectl get pods -n kube-system** <br/> <br/>


