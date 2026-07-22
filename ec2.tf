resource "aws_key_pair" "deployer" {
 key_name = "my-terra-key"
 public_key = file("C:/Users/hp/Downloads/terraform-practice/terraform-practice/terra-key.pub")
}


resource "aws_default_vpc""default" {
  
}
resource "aws_security_group" "merisecurity" {
  name = "allow ports"
  description = "this SG is to open ports for EC2 instance"
  vpc_id =aws_default_vpc.default.id
  
  ingress { 
    description = "this is for ssh"
    from_port = 22
    to_port = 22
    protocol ="tcp"
    cidr_blocks =["0.0.0.0/0"]

  }

  egress{
    description ="this is for outgoing internet"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "my-instance" {
   ami           = "ami-0e5497a77ef21b5ac"
    instance_type = "t3.micro"
    key_name = aws_key_pair.deployer.key_name
    security_groups = [aws_security_group.merisecurity.name]
    tags = {
      name = "terra-automate"
    }
  
}