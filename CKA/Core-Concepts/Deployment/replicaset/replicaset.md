Replication Controller ✍:
==========================

Controllers are brain behind the kubernetes. They are the processes that monitor kubernetes objects and respond accordingly. <br/>

**So what is a replica and why do we need replication controller?:** <br/>

➜ Let's go to past scenario where we had single pod running our application. 
⚠️ What if for some reason our application crashes and pod fails, users will be no longer be able to access our application ?

<img width="210" height="198" alt="image" src="https://github.com/user-attachments/assets/df2f19db-935b-48f8-add4-bc442c6bff70" /> <br/>

📢 To prevent users from losing access to our application, **we would like to have more than one instance running at the same time.** <br/>
↪ That way if one fails, we still have our application running on the other one. <br/>

↪ The replication controller helps us run multiple instances of a single pod in a cluster, Thus providing high availability. <br/>

<img width="284" height="230" alt="image" src="https://github.com/user-attachments/assets/9d4d5316-7148-4f1e-8000-a13ed9c9d260" /> <br/>

**Replication Controller vs ReplicaSet** <br/> <br/>

<img width="334" height="85" alt="image" src="https://github.com/user-attachments/assets/ecff34c0-68a0-42e6-a3de-c07681d0e463" /> <br/>

▶ There are two similar terms **Replication Controller and ReplicaSet.** <br/>
▶ Both have the same purpose, but both are not same(hehe) <br/>
❝ Replication Controller is the older technology that is being replaced by **replica set**❞ <br/>
❝ ReplicaSet is the new recommended way to set up replication ❞ <br/>
