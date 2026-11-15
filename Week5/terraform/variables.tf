variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "ssh_allowed_cidr" {
  description = "CIDR block allowed to access SSH"
  type        = string
  default     = "127.0.0.1/32"
}

variable "api_allowed_cidr" {
  description = "CIDR block allowed to access the Task API"
  type        = string
  default     = "127.0.0.1/32"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "devops-week5"
}
