//Providers in AWS:


provider "aws" { 
   region = "us-east-01"  //in which region u want to deploy ur aws resources.
   access_key = "paste the key that's generated while creating in AWS IAM user"
   secret_key = "paste the key that's generated while creating in AWS IAM user"
}


// First Resource in AWS
//EC2

resource "aws_instance" "example" {
  ami= "ami-00dhhujdnnd"
  instance_type = "t2.micro"

  tags = {
     Name = "my-ec2" // This is name the ec2 instance as "my-ec2"
  }
}
