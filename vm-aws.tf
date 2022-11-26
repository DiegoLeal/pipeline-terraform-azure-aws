#resource "aws_key_pair" "key" {
#  key_name   = "aws-key"
#  public_key = var.aws_pub_key
#}

variable "key_name" {default="aws"}
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "aws_key_pair" "generated_key" {
  key_name   = "${var.key_name}"
  public_key = "${tls_private_key.key.public_key_openssh}"
}

resource "aws_instance" "vm" {
  ami                         = "ami-0d527b8c289b4af7f"
  instance_type               = "t2.micro"
#  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  tags = {
    "Name" = "vm-terraform"
  }
}