YAML in Kubernetes:
=====================
📌 Kubernetes uses YAML files as inputs for the **creation of objects** such as **Pods**, **replicas**, **deployments**, **services** etc. <br/>
📌 A Kubernetes definition file always contains four top level fields the **API Version**, **kind**, **metadata** and **spec**. <br/>

<img width="311" height="170" alt="image" src="https://github.com/user-attachments/assets/f0dbaead-76f1-4998-bf7a-3aa13a10fad1" /> <br/>

⤷ These are the top level/root level properties. <br/>
⤷ These are also required fields, so you must have them in your configuration file. <br/>

**1. API Version:** <br/>
▶︎ This is the **version of the** **kubernetes API** we are using to create the object. Depending on what we are trying to create, we use right API version. <br/>
▶︎ We'll set the API Version as v1 as it is for **Pod**. <br/>

**2. kind:** <br/>
▶︎ The kind refers to the type of object we're trying to create, in this case it's a pod. <br/>

**3. metadata:** <br/>
▶︎ The metadata is data about the object like its name, labels, etc <br/>

<img width="233" height="99" alt="image" src="https://github.com/user-attachments/assets/63ee4837-af4e-4b3d-979e-5803242ef945" /> <br/>

**4. spec:** <br/>
▶︎ This is where we would provide additional information to k8s with respect to that object. This is going to be different for diff objects. <br/>
**❝ The spec section defines what's inside the object we are creating. ❞** <br/>

<img width="270" height="154" alt="image" src="https://github.com/user-attachments/assets/97d6efe0-9cbf-4127-bb55-c1acb88ff8c1" />




