🔄 **What is a Reverse Proxy?** <br/>

A **reverse proxy** is a server that sits in front of your **backend servers (like web apps, APIs, services)** and forwards **client requests** to them. <br/>

Think of it like a **receptionist** at the front desk: <br/>
📢 **Visitors (clients) talk to the receptionist (reverse proxy)** <br/>
📢 **The receptionist talks to the actual employees (backend servers)** <br/>
📢 **The visitor never directly meets the employee (backend server)** <br/>

🧠 **Why Use a Reverse Proxy?** <br/>

🔒 **1. Security** <br/>

    📎 Hides internal servers from the public. <br/>
    📎 Prevents direct access to services (e.g., http://myapp.internal.local) <br/>

⚖️ **2. Load Balancing** <br/>
    📎 Distributes traffic across multiple backend servers for better performance. <br/>

🧩 **3. Centralized Routing** <br/>
    📎 Routes requests to different apps/services based on URL or hostname. <br/>

🔧 **How It Works (Visual)** <br/>

              CLIENT  <br/>
                |   <br/>
         [ Reverse Proxy ] <br/>
        /       |       \  <br/>
    App1       App2      App3 <br/>
