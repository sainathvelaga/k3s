variable "zone_name" {
  type        = string
  default     = "sainathdevops.space"
  description = "description"
}

# variable "security_group" {
#   type        = list(string)
#   default     = [sg-05a71b86f22d4fe93]
#   description = "description"
# }

# variable "subnet_id" {
#   type        = string
#   default     = "subnet-0883d5d28eca5f540"
#   description = "description"
# }

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region to deploy resources"
}

variable "bucket_name" {
  type        = string
  default     = "state-tf-projects"
  description = "S3 bucket name for state file"
}
variable "table_name" {
  type        = string
  default     = "terraform-state-locks"
  description = "DynamoDB table name for state locking"
}