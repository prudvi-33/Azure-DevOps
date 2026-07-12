✍ It is a bit difficult to **create and edit YAML files**. Especially in the CLI. <br/><br/>
During the exam, you might find it difficult tocopy and paste YAML files from browser to terminal. <br/>
📌 **Using the kubectl run command can help in generating a YAML template.** <br/>
And sometimes, you can even get away with just the **kubectl run command** without having to **create a YAML file at all**. <br/> 

For example, if you were asked to create a pod or deployment with specific name and image you can simply run the kubectl run command.
======================================================================================================================================

✅️ Use the below set of commands and try the previous practice tests again, but this time try to use the below commands
instead of YAML files. Try to use these as much as you can going forward in all exercises. <br/>

Reference (Bookmark this page for exam. It will be very handy): <br/>
**https://kubernetes.io/docs/reference/kubectl/conventions/**

✦ **Create an NGINX Pod** : <br/>
kubectl run nginx --image=nginx <br/> <br/>

✦ **Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)**: <br/>
kubectl run nginx --image=nginx --dry-run=client -o yaml <br/><br/>

✦ **Create a deployment**: <br/>
kubectl create deployment --image=nginx nginx <br/> <br/>

✦ **Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)**: <br/>
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml <br/> <br/>

✦ **Generate Deployment YAML file (-o yaml). Don’t create it(–dry-run) and save it to a file.**: <br/>
kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml <br/> <br/>

✦ **Make necessary changes to the file (for example, adding more replicas) and then create the deployment.**: <br/>
kubectl create -f nginx-deployment.yaml <br/> <br/>

**OR** <br/> <br/>

**In k8s version 1.19+, we can specify the --replicas option to create a deployment with 4 replicas.** <br/>
kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml <br/> <br/>
