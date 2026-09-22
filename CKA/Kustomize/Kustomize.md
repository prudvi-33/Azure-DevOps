<img width="478" height="280" alt="image" src="https://github.com/user-attachments/assets/39108af4-7803-4f77-9d8a-a1501c0635dd" /> <br/> <br/>
<img width="461" height="269" alt="image" src="https://github.com/user-attachments/assets/06c010b1-60dd-4428-bab4-8d6c022d44a0" /> <br/> <br/>
<img width="467" height="234" alt="image" src="https://github.com/user-attachments/assets/4ab481ad-73e1-4526-a42d-89ebaf2a9224" /> <br/> <br/>
<img width="480" height="242" alt="image" src="https://github.com/user-attachments/assets/15c4a0f3-39bb-47e7-a765-f1589a279612" /> <br/> <br/>
<img width="476" height="224" alt="image" src="https://github.com/user-attachments/assets/c9d21717-73b7-42b3-aa65-d5fd4ca9a183" /> <br/> <br/>

Kustomize installation:
=======================
⚫ Before installing **Kustomize**, You must first have a **kubernetes cluster up and running** and **kubectl** installed on your local machine and configured to connect to your kubernetes cluster. <br/>
⚫ Kustomize can be installed on a **Linux, Windows or a Mac Machine.** <br/> <br/>
<img width="491" height="223" alt="image" src="https://github.com/user-attachments/assets/860a3a6d-45c4-4ea6-836a-6d144a5ac62e" /> <br/> <br/>
<img width="501" height="267" alt="image" src="https://github.com/user-attachments/assets/101dc394-3f61-48cf-906c-d56b209b68b1" /> <br/> <br/>
<img width="476" height="193" alt="image" src="https://github.com/user-attachments/assets/2343b631-6315-4d1c-972d-a8dcfc0eab87" /> <br/> <br/>

Apply Kustomize configs:
========================
<img width="506" height="232" alt="image" src="https://github.com/user-attachments/assets/70746d83-5106-4dc6-af52-f00379e61ac0" /> <br/> <br/>
⚫ We're applying a file that comes from output of the first command, which is the **kustomize build k8s/** command. <br/>
⚫ So what we're doing is taking is the output of the command and applying it as input of the other command. <br/>
⚫ We can do this natively with just kubectl tool as well like **kubectl apply -k k8s/** . We pass -k instead of -f. <br/> <br/>
<img width="172" height="41" alt="image" src="https://github.com/user-attachments/assets/ea2df7f7-28aa-4053-9da2-3deb84534ace" /> <br/> <br/>
<img width="509" height="230" alt="image" src="https://github.com/user-attachments/assets/4f736d53-d951-47e8-bacb-c001966e165b" />





