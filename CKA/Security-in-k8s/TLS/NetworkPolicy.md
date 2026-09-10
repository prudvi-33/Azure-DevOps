Must commands to know for CKA:
==============================
1. kubectl get pods --show-labels - This will show pod specific labels.
2. kubectl get ns --show-labels - This will show ns specific labels. <br/> <br/>
It has no unique labels, add one yourself before writing your policy:
3. kubectl label ns-name "key=value" <br/> <br/>
