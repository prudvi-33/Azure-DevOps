✦ To see the revisions and history of rollout, run <br/>
**kubectl rollout history deployment/deployment-name** <br/> <br/>
<img width="288" height="59" alt="image" src="https://github.com/user-attachments/assets/8f1f66ab-698b-4d5d-8468-08934da8b4e2" /> <br/> <br/>

👉 **We've two types of Deployment strategies:** <br/> <br/>
<img width="341" height="137" alt="image" src="https://github.com/user-attachments/assets/b4b5abce-1400-4a34-a33c-01517320badf" /> <br/> <br/>

⮞ Say for example you have **five replicas of your web application instance deployed**.
✅️ One way to upgrade these to a newer version is to destroy all of these, and **then create newer versions of application instances.** <br/>
⮞ Meaning **first destroy the five running instances** and then deploy **five new instances of the new application version**. <br/> <br/>
<img width="511" height="137" alt="image" src="https://github.com/user-attachments/assets/75f5c2e2-4327-4255-b7af-062d26dec7bc" /> <br/> <br/>
⚠️ Problem with this is, **during the period after the older versions are down and before any newer version is up**, the application is down and inaccessible to users. <br/> <br/>
<img width="503" height="100" alt="image" src="https://github.com/user-attachments/assets/37a3b035-04ff-4902-9449-5508c1b173dd" /> <br/><br/>
⮞ This strategy is known as **Recreate strategy**, and this is not the **default deployment strategy.** <br/>
✅️ The **second strategy** is where we do not destroy all of them at once. Instead, **we take down the older version and bring up a newer version one by one.** <br/>
⮞ This way the application never goes down and the upgrade is seamless. <br/> <br/>
<img width="502" height="86" alt="image" src="https://github.com/user-attachments/assets/2011ab83-f83d-4496-bc30-04564a84be3c" /> <br/> <br/>
📌 Remember, if you do not specify a strategy while creating the deployment, it will assume it to be **rolling Update**. <br/>
󠁯•󠁏󠁏 In other words, **rolling update** is the **default deployment strategy**. <br/>

**Commands you should know:** <br/>
✦ **kubectl apply -f deployment-file.yaml** <br/>
✦ **kubectl set image deployment/myapp-deployment "container-name"="imagename:tag"** <br/> <br/>
<img width="437" height="272" alt="image" src="https://github.com/user-attachments/assets/647cdd5a-7510-40a9-a16c-5186e60d74d7" /> <br/> <br/>
**Verify the Change**: <br/>
✦ You can check the progress or success of your rolling update using the following: <br/>
**kubectl rollout status deployment/my-nginx-deployment** <br/>
❌ If you realize something isn't very right. Something's wrong with the new version of build you used to upgrade, then we would like to roll back the update. <br/>
➡️ Kubernetes deployments allow you **to roll back to a previous revision To undo a change**. <br/>
**kubectl rollout undo deployment myapp-deployment** <br/>
➡️ The deployment will then destroy the pods in the new replica set and bring the older ones up in the old replica set, and your application is back to its older format.<br/> <br/>

<img width="503" height="224" alt="image" src="https://github.com/user-attachments/assets/1a365473-f4d7-4c5f-bc97-ff75932de10e" /> <br/> <br/>

✅ **Commands Summary:** <br/> <br/>
<img width="451" height="256" alt="image" src="https://github.com/user-attachments/assets/aa9cd84f-49bc-4abe-9320-a3ad7fbab5f8" /> <br/><br/>






















