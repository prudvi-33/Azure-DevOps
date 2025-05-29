1) When you try access kubernetes private cluster(AKS) objects like deployments,statefulsets etc. you will see like <br/>

![image](https://github.com/user-attachments/assets/f03ff602-f5d2-4e69-85c2-71e85fc2e132)  <br/>

In that case, you can access the cluster resources/objects through cmd in ur local:  <br/>
   1) az aks command invoke --resource-group <rg-doc-ai-studio-dev-01> --name <aks-docaistudio-hc> --command <'kubectl get cm'>
