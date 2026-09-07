✅To check if the any user has certain actions on k8s resources. We can run <br/>
1. kubectl auth can-i list pods --as=john --namespace=development
2. kubectl get pods --as=username.
✅ To see users defined in your local config file, If you want to see which human user credentials are saved inside your active configuration file, run: <br/>
**kubectl config get-users** <br/> <br/>
<img width="258" height="64" alt="image" src="https://github.com/user-attachments/assets/39f5c056-5111-4bfd-beaf-50c9588e5419" /> <br/>


Imp Commands for CKA:
=====================
1. kubectl config view
2. kubectl config get-users
3. kubectl config get-contexts
4. kubectl config current-context
