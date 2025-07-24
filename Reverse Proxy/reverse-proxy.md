🔄 **What is a Reverse Proxy?** <br/>

A **reverse proxy** is a server that sits in front of your **backend servers (like web apps, APIs, services)** and forwards **client requests** to them. <br/>

Think of it like a **receptionist** at the front desk: <br/>
📢 **Visitors (clients) talk to the receptionist (reverse proxy)** <br/>
📢 **The receptionist talks to the actual employees (backend servers)** <br/>
📢 **The visitor never directly meets the employee (backend server)** <br/>

🧠 **Why Use a Reverse Proxy?** <br/>

🔒 **1. Security** <br/>

    📎 Hides internal servers from the public.
    📎 Prevents direct access to services (e.g., http://myapp.internal.local)

⚖️ **2. Load Balancing** <br/>
    📎 Distributes traffic across multiple backend servers for better performance. <br/>

🧩 **3. Centralized Routing** <br/>
    📎 Routes requests to different apps/services based on URL or hostname. <br/>

🔧 **How It Works (Visual)** <br/>

              CLIENT  
                |   
         [ Reverse Proxy ] 
        /       |       \  
    App1       App2      App3 


🔁 **The Flow – Step-by-Step** <br/>
============================================

✅ **1. Client Sends Request** <br/>

    Client (browser) → opens https://www.techospace.com/login 
This is a login page, but the browser doesn't know where the actual backend is. <br/>

✅ **2. Request Hits the Reverse Proxy** <br/>

    https://www.techospace.com/login → Nginx Reverse Proxy (public-facing) 
   
   Nginx accepts the HTTPS request from the browser. <br/>
   It does not handle the login itself, it just knows where to forward it internally. <br/>

✅ **3. Reverse Proxy Forwards to Backend** <br/>

    Nginx forwards request → http://10.0.3.12:5000/api/login
                        (Node.js backend server)


✔️ This backend server is not exposed to the internet. <br/>
✔️ Only the reverse proxy knows it exists. <br/>
✔️ This is why it’s more secure and centralized. <br/>

✅ **4. Backend Responds to Reverse Proxy** <br/>

    Node.js backend → sends login result → Nginx    

✅ **5. Reverse Proxy Sends Response to Client** <br/>

    Nginx → sends the response back to browser
