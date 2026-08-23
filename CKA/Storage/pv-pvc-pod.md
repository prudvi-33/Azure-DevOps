Static Volume Provisioning in k8s:
======================================
PV and PVC and attaching PVC to pod:
====================================

<img width="533" height="255" alt="image" src="https://github.com/user-attachments/assets/46ddb05c-bfb2-4e5f-bffc-ff050f761640" /> <br/> <br/>
✦ The problem here is that before the PV is created, you must have created the disk on Cloud. (Eg: Google Cloud). <br/>
✦ Every time an application requires storage, you have to first manually provision the disk on Google Cloud and then manually create a persistent Volume definition file. <br/>
✦ **That's called Static provisioning of Volumes**. <br/> <br/>
✦ It would have been nice if the volume gets provisioned automatically when the application requires it. That's where storage classes comes in.  <br/> <br/>
✦ Storage classes, you can define a provisioner, such as Google Storage, that can automatically provision storage on Google Cloud and attach that to pods when a claim is made. <br/> <br/>
✦ **That's called Dynamic Provisioning of Volumes**. <br/> <br/>
<img width="341" height="215" alt="image" src="https://github.com/user-attachments/assets/3c3557ee-4d3b-4149-9698-32750f9a96b9" /> <br/> <br/>
<img width="550" height="256" alt="image" src="https://github.com/user-attachments/assets/d055779b-7cfc-4724-9f14-029f10be7d94" /> <br/> <br/>




