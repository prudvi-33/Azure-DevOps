Storage classes in DockeR:
=========================
➤ Storage class help manage storage on images and containers. <br/>
⋆ The below are the storage Drivers <br/>
✦ AUFS. <br/>
✦ ZFS. <br/>
✦ BTRFS. <br/>
✦ Device Mapper. <br/>
✦ Overlay. <br/>
✦ Overlay2. <br/> <br/>

Volume Drivers in DockeR:
==========================
⬩ As Containers are ephemeral, If you want to persist storage, you must create volumes. <br/>
⬩ Volumes are not handled by **Storage Drivers**, Volumes are handled by Volume driver plugins.  <br/>
⬩ The default volume plugin is "**local**" <br/>
⬩ The "**local**" volume plugin helps create a volume on a Docker Host and store its data under the **var/lib/docker_volumes** directory. <br/>
⬩ There are many other volume driver plugins that allow you to create a volume on third-party solutions like **Azure File Storage, Digital Ocean Block Storage, Flocker etc** <br/> <br/>
<img width="422" height="224" alt="image" src="https://github.com/user-attachments/assets/30acf592-cea0-4f9e-8acc-cc6f8741452c" />



