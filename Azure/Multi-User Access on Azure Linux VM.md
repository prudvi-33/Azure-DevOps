🎯 **Goal:** <br/>

🔷 Let multiple developers/users SSH into one Linux VM (with public IP) using individual **usernames/passwords**. <br/>

🛠️ **Step-by-Step Plan** <br/>

✅ Step 1: Create Dev Users <br/>

             sudo adduser dharani           # provide username
             sudo passwd dharani            # Set a password
             
✅ Step 2: Validate (Ask the user to check/SSH) <br/>

             ssh dharani@<linux-vm-ip> <br/>
