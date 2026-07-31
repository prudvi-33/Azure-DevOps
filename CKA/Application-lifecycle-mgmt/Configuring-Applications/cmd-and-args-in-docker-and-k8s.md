 Args and Entrypoints in Docker: <br/>
 ===============================
 ✦ How do you specify a different command to start a container❓ <br/>
 ✦ One option is to append a command to the **docker run** command. In that way it overrides the default command specified within the image. <br/> <br/>
 <img width="230" height="85" alt="image" src="https://github.com/user-attachments/assets/bd9271a5-cd84-4a6f-85e5-fbc1603792ce" /> <br/> <br/>
 ✦ When you specify a command in JSON Array Format, the first element in the array should be executable. The command and its parameters should be separate elements in the list. <br/> <br/>
 <img width="450" height="95" alt="image" src="https://github.com/user-attachments/assets/fc1cbdb5-6b93-42b2-aa5a-a96ffe96a4a5" /> <br/> <br/>
 ✦ **Entrypoint** defines Executable command. **CMD** provides default args. <br/> <br/>
 <img width="398" height="148" alt="image" src="https://github.com/user-attachments/assets/034dd8ef-e76a-4fa7-b99d-50ddb7520a85" /> <br/> <br/>
 ✦ How do you configure a default value for the command if one was not specified in the command line. <br/> 
 ✦ That's where we would use both ENTRYPOINT and CMD both together. <br/><br/>
 <img width="380" height="164" alt="image" src="https://github.com/user-attachments/assets/aae365fd-1183-4a10-a452-f85739aa3b73" /> <br/> <br/>
 ✦ Here, the **CMD** instruction will be appended to the **ENTRYPOINT** instruction. <br/> <br/>

 Commands and Args in K8s pod: <br/>
 ==============================
 <img width="450" height="209" alt="image" src="https://github.com/user-attachments/assets/c0c43949-fc5c-46d0-a172-08c3eef5501a" /> <br/> <br/>
 <img width="358" height="185" alt="image" src="https://github.com/user-attachments/assets/be673328-023d-4dd6-b780-768518354ac6" />




