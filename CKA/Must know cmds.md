📌Must know commands in K8s for CKA:
=======================================

✅️ **kubectl explain:** <br/>

**kubectl explain** command provides instant access to the Kubernetes API documentation and resource schema directly from your terminal. It details the **structure of Kubernetes objects (like Pods, Deployments, or Services) and 
explains what each field does, its data type, and whether it is a required property**.  <br/>

**Syntax**: kubectl explain "resource_name" <br/>
**Example**: kubectl explain deployment <br/>
✦ View the top-level description and available fields for a **deployment** object. <br/>

✅️ **kubectl edit:** <br/>

**kubectl edit** is an imperative Kubernetes command that lets you modify a **k8s objects** live configuration directly in the cluster.

**Syntax**: kubectl edit resource_type resource_name <br/>
**Examples:** <br/> <br/>

✦︎ Edit a deployment: **kubectl edit deployment my-deployment**. <br/>
✦︎ Edit a specific pod: **kubectl edit pod mypod**. <br/>

✅️ **kubectl scale:** <br/>

**kubectl scale** command is used to change the number of running replicas for a Kubernetes workload (such as a Deployment, ReplicaSet, StatefulSet, or ReplicationController). <br/>

**Examples:** <br/>
✦ Scale the deployment to 3 replicas. <br/>
  **kubectl scale deployment mydeploy --replicas=3** <br/> <br/>
✦ Scale using YAML file. <br/>
**kubectl scale -f deployment.yaml --replicas=3** <br/> <br/>
✦ Scale multiple deployments. <br/>
**kubectl scale deployment/deploy1 deployment/deploy2 --replicas=3** <br/>

