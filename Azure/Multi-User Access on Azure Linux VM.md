🎯 **Goal:** <br/>

🔷 Let multiple developers/users SSH into one Linux VM (with public IP) using individual **usernames/passwords**. <br/>

🛠️ **Step-by-Step Plan** <br/>

◆ Login to the Linux VM. <br/>

✅ Step 1: Create Dev Users <br/>

             sudo adduser dharani           # provide username
             sudo passwd dharani            # Set a password
             
✅ Step 2: Validate (Ask the user to check/SSH) <br/>

             ssh dharani@<linux-vm-ip> <br/>

========================================================================================================================

🛠️ **Multi-User Access on Azure Linux VM (for AKS Private Cluster Logs)** <br/>

Now, **multiple developers into single VM, , so they can run kubectl logs and view live AKS pod logs**. <br/>

Here, Once you create 
