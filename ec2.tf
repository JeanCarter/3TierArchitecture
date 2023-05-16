# resource "aws_key_pair" "sample_auth" {
  # key_name   = "samplekey"
  # public_key = file("~/.ssh/samplekey.pub")



resource "aws_instance" "web" {
  ami           = "ami-06e46074ae430fba6"
  instance_type = "t2.micro"

  vpc_security_group_ids      = [aws_security_group.allow_tls.id]
  subnet_id                   = aws_subnet.public[count.index].id
  associate_public_ip_address = true
  count                       = 2

  tags = {
    # Name = "webserver"
  }
}

#  provisioner "file" {
    # source = "./demo.pem"
    # destination = "/home/downloads/demo.pem"
  
    # connection {
      # type = "ssh"
      # host = self.public_ip
      # user = "ec2-user"
      # private_key = "${file("./demo.pem")}"
    
  



resource "aws_instance" "db" {
  ami                    = "ami-06e46074ae430fba6"
  instance_type          = "t2.micro"
  key_name               = "samplekey"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = {
    Name = "DB Server"
  }
}