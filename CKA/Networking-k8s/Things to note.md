✅ If you want to check **IP range for k8s services** - <br/>
Go to **cat /etc/kubernetes/manifests/kube-apiserver.yaml** - U can able to see an option **--service-cluster-ip-range** in **kube-apiserver.yaml** file. <br/> 
Another way is Run **kubectl get servicecidr**<br/> <br/>
<img width="224" height="53" alt="image" src="https://github.com/user-attachments/assets/6d7c53bc-b617-41f6-a38c-d328700e8b07" /> <br/> <br/>

✅ If you want to check **IP Ranges for Pods** - <br/>
Inspect **kube-controller-manager-controlplane** pod following **kube-system** namespace. U can able to see an option **--cluster-cidr=172.17.0.0/16** <br/>
**kubectl describe pod kube-controller-manager-controlplane -n kube-system** <br/> <br/>
<img width="387" height="236" alt="image" src="https://github.com/user-attachments/assets/bc10865e-128f-452f-98eb-d9d8737cc5ad" /> <br/> <br/>

✅ If you want to check **IP ranges for Nodes** - <br/>
U can get using **kubectl get nodes -o wide** command.

**Pro Tip for CKA**:
If the API server pods are named differently or you cannot find the flags via **kubectl describe**, **SSH directly into your control-plane node** and check the manifest files directly in **/etc/kubernetes/manifests/.**
