variable "aws_region" {
  type = string
  default = "ap-southeast-2"
}
variable "function_name" {
  type = string
}
variable "lambda_runtime" {
  description = "Lambda runtime environment"
  type        = string
  default     = "python3.9"
}

variable "lambda_handler" {
  description = "Handler function"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_zip_file" {
  description = "Path to Lambda deployment package"
  type        = string
}
