variable "location" {
  description = "Variável que indica a região onde os recursos vão ser criados"
  type        = string
  default     = "East US"
}

variable "aws_pub_key" {
  description = "Public key VM AWS"
  type        = string
}

variable "azure_pub_key" {
  description = "Public key VM AZURE"
  type        = string
}

variable "aws_region" {
  type        = string
  description = ""
  default     = "us-east-1"
}

variable "instance_ami" {
  type        = string
  description = ""
  default     = "ami-09d56f8956ab235b3"
}

variable "instance_type" {
  type        = string
  description = ""
  default     = "t2.micro"
}