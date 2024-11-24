resource "aws_instance" "ramya" {
  ami           = "ami-06c68f701d8090592"
  instance_type = "t2.micro"
     availability_zone = "us-east-1"
tags = {
        Name = "terraform-EC2-EBS"
   }
}
 resource "aws_ebs_voulme" "ramya"{
  availability_zone = "us-east-1"
  size              = 3

  tags = {
    Name = "terraform-EC2-EBS"
  }
}
resource "aws_volume_attachment" "ramya" {
  device_name = "/dev/sb"
  volume_id   = aws_ebs_volume.ramya.id
  instance_id = aws_instance.ramya.id
}
