<img width="687" height="196" alt="image" src="https://github.com/user-attachments/assets/90dc65fb-6305-4d5a-9d63-e23af068bdcf" />
<br/>
<img width="693" height="209" alt="image" src="https://github.com/user-attachments/assets/276b8014-4981-4d51-bb9f-c534d5a3540c" />
<br/>

We can also check the current-context and status of the **eks cluster** using the below commands: <br/>

<img width="559" height="55" alt="image" src="https://github.com/user-attachments/assets/b19fb805-08cb-4bf8-bd73-73f7a2ecedea" />

Here we can **Enable EKS Auto mode** in many ways: Either through **AWS CLI, eksctl and terraform:** <br/>

Now let's try using AWS CLI and manual way:
=============================================

<img width="656" height="288" alt="image" src="https://github.com/user-attachments/assets/e197c063-79dc-40b6-9bc8-6621ef31c331" /> <br/>

1. Navigate to **EKS** service and navigate to Clusters and select one cluster and navigate to Cluster IAM role. <br/>
then,
2. Navigate to Trust Relationships and click Edit and add the marked line.
<img width="350" height="158" alt="image" src="https://github.com/user-attachments/assets/69ebedd5-ef44-4516-a31e-0792f64c4c90" />
and save <br/>

3. Next, navigate to IAM  and navigate to policies and search for **AmazonEKSClusterPolicy** , if u found it well. <br/>
Now open CLI, and run few commands to attach <br/>

**AmazonEKSClusterPolicy** <br/>
**AmazonEKSComputePolicy** <br/>
**AmazonEKSBlockStoragePolicy** <br/>
**AmazonEKSLoadBalancingPolicy** <br/>
**AmazonEKSNetworkingPolicy** <br/>
these above policies to the cluster IAM Role.

So firstly navigate to **AWS CLI**, and run to know cluster IAM role for the EKS cluster: <br/>
 <img width="617" height="26" alt="image" src="https://github.com/user-attachments/assets/f207cf08-3717-43c3-bf99-b240ebd031a7" /> <br/>

Once u get to know about the **Cluster role** name, then run the below commands to attach **each existing policies** to the **cluster role**: <br/>

aws iam attach-role-policy \
    --role-name <role-name> \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy

aws iam attach-role-policy \
    --role-name <role-name> \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSComputePolicy

aws iam attach-role-policy \
    --role-name <role-name> \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSBlockStoragePolicy

aws iam attach-role-policy \
    --role-name <role-name> \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSLoadBalancingPolicy

aws iam attach-role-policy \
    --role-name <role-name> \
    --policy-arn arn:aws:iam::aws:policy/AmazonEKSNetworkingPolicy 
