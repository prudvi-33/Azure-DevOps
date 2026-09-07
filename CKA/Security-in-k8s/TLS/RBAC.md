To check if the any user has certain actions on k8s resources. We can run <br/>
1. kubectl auth can-i list pods --as=john --namespace=development
2. kubectl get pods --as=username.
