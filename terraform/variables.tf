variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "key_name" {
  type        = string
  default     = "my-new-aws-key"
}

variable "instance_type" {
  type        = string
  default     = "t2.medium"
}

variable "ami_id" {
  type        = string
  default     = "ami-0ecb62995f68bb549" # Ubuntu 22.04
}

variable "node_count" {
  type        = number
  default     = 6 # 1 master + 1 jenkins + 3 workers + 1 DevOps-Server
}

variable "enable_Jenkins" {
  type    = bool
  default = false
}
