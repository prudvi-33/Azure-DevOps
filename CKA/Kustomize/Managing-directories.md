The limitations and Solutions:
==============================

⚫ multiple apps config inside single root folder. <br/> <br/>
<img width="378" height="185" alt="image" src="https://github.com/user-attachments/assets/bda86df4-31be-41ce-8f52-30a5a366991a" /> <br/> <br/>
**Solution:** <br/>
<img width="368" height="194" alt="image" src="https://github.com/user-attachments/assets/1ae7dbe3-c8b2-4f0b-a8ed-6baa9f7b547d" /> <br/> <br/>
⚫ But still the above solution is a limitation. when there's more number of directories, we cant go and apply into each and every folder as below pic. <br/> <br/>
<img width="514" height="263" alt="image" src="https://github.com/user-attachments/assets/93cac1f6-fe82-4d6f-9627-4484b3d04ab2" /> <br/> <br/>
⚫ So to get out of that messy, we do create root kustomization.yaml and put all file configs, as below pic. <br/> <br/>
<img width="492" height="228" alt="image" src="https://github.com/user-attachments/assets/717e0191-bb56-4172-8e9f-b239061c0624" /> <br/> <br/>
<img width="511" height="198" alt="image" src="https://github.com/user-attachments/assets/bf7ddcf1-f30a-444c-b2dd-1c7743c4d6ed" /> <br/> <br/>
⚫ But still not a perfect solution. What if the directories grows more? We cannot spend more time on putting those configs in root kustomization.yaml as below. <br/> <br/>
<img width="497" height="239" alt="image" src="https://github.com/user-attachments/assets/604f4ec8-efae-45db-a184-a11453212e51" /> <br/> <br/>
⚫ The solution and what we can handle in a way in kustomize as below. <br/> <br/>
<img width="499" height="258" alt="image" src="https://github.com/user-attachments/assets/ef7dcf14-2878-4c99-bb45-b9a39dac77b1" />




