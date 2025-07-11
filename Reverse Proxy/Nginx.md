📌 **NGINX** <br/>

🔹 NGINX is a high-performance web server used to serve static content, reverse proxy traffic, and load balance requests. <br/>
🔹 NGINX is commonly used to improve performance, scalability, and security of web applications. <br/> <br/>

<img width="1210" height="720" alt="image" src="https://github.com/user-attachments/assets/54c6b3ee-a447-4d1c-84d5-3cdc6128cdf3" /> <br/>

<img width="818" height="147" alt="image" src="https://github.com/user-attachments/assets/81fe9ab5-14e1-4568-819f-957685fdc1f7" /> <br/>

📌 **NGINX Installation:** <br/>

🔹 If you are using VM it could be (AWS or Azure), **log into that Ubuntu VM** then, Run the below **commands**: <br/>

    sudo apt update
    sudo apt install nginx -y

🔹 Once you install te nginx, run the below command to check the **version** and status of **nginx**  <br/>

    nginx -version
    systectl status nginx 
    
<img width="1091" height="336" alt="image" src="https://github.com/user-attachments/assets/45e2cb25-9fff-43f2-a06d-0986c79e0014" />  <br/> <br/>
    

  🧾 **Nginx Default Configuration Details You Should know:(After Installation)** <br/>

✅ 1.**Default Web Root (HTML files)** <br/>

     /var/www/html/

📍 This is where the default **index.html** lives. <br/>
📍 If you access your VM IP in a browser, it serves from here. <br/>

<img width="400" height="267" alt="image" src="https://github.com/user-attachments/assets/7e7150e6-62b1-463a-85b5-96161b4177ac" />
 <br/>

✅ 2. **Main Config File** <br/>

    /etc/nginx/nginx.conf

📍 Main Nginx configuration file.    <br/>

✅ 3. **Site Configurations** <br/>

    /etc/nginx/sites-available/ 

📍 This is where Nginx keeps **all the available site configurations.** <br/>
📍 You define how **each website** should behave (port, root folder, reverse proxy, etc) here, but they’re not “live” yet. <br/>

 <img width="1215" height="160" alt="image" src="https://github.com/user-attachments/assets/5ea751a5-ad04-46c6-9741-2903ab6a307e" />
<br/> <br/>

 <img width="400" height="263" alt="image" src="https://github.com/user-attachments/assets/8fa46b59-fe6a-4119-a488-dd384f10475c" />
 <br/>

✅ 4. **Enabled Sites** <br/>

    /etc/nginx/sites-enabled/

👉 But instead of creating full files here, we just create a **shortcut (symlink)** to the file in **sites-available**. <br/>   
👉 You write **config** in **sites-available**. <br/>
👉You activate it by **linking** it into **sites-enabled**. <br/>


✅ 5. **Log Files** <br/>

    /var/log/nginx/access.log
    /var/log/nginx/error.log

<img width="300" height="170" alt="image" src="https://github.com/user-attachments/assets/812370f6-0005-4033-a6fa-6308e4b85a78" />

👉 Use these to **debug traffic and errors**.  <br/>
