How terraform communicates/authenticates with AWS: (Traditional way)
====================================================================

1. Terraform can authenticate/communicate with AWS by Using/creating **Access key Secret key** in AWS User. <br/>
2. While creating secret key inside AWS user we have to Choose **security credentials**--> **Access Key**, and create **Access key**. <br/>
3. The usecase as AWS CLI - for using access key to enable AWS CLI in our local <br/>
to/for accessing AWS Account and CRUD operations for AWS Resources/Services. <br/>

Why Access key and Secret key are needed in AWS:
================================================
**1. Programmatic Access:** <br/>
=========================
◼️ **What:** These keys allow applications, scripts, and command-line tools to interact with AWS services without human intervention. <br/>
◼️ **Why:** Unlike logging in to the AWS Management Console (which is for humans using passwords and multi-factor authentication), servers, applications, and tools need a way to authenticate automatically. <br/>
◼️ **How:** The access key pair acts like a username and password for APIs, SDKs, and CLI operations. <br/>

**2. Authentication and Authorization** <br/>
===========================================
◼️ **Authentication:** The keys prove the identity of the user or app making the API request. <br/>
◼️ **Authorization:** AWS checks what actions this identity is allowed to perform by evaluating IAM policies attached to it. <br/>
◼️ **Result:** Only the allowed API calls and actions (like uploading to S3, launching EC2 instances, etc.) are permitted. <br/>


Providers:
==========

A provider in Terraform is a plugin that lets Terraform interact with various APIs (like AWS, Azure, Google Cloud, Datadog, GitHub, etc.). <br/>

◼️ When we run **terraform init**, plugins required for the provider are automatically downloaded and saved locally to a .terraform directory.
