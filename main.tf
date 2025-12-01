#creating trust policy
data "aws_iam_policy_document" "lambda_assume" {
   statement {
         effect = "Allow"


         principals {
              type = "services"
              identifiers = ["lambda.amazonaws.com"]
         }

    actions = ["sts:AssumeRole"]
  }
}

#creating role

resource "aws_iam_role" "lambda_fun" {
    name = "lambda_fun"
    assume_role_policy = aws_iam_policy_document.lambda_assume.json
}

#creating policy and attaching it to role
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role = aws_iam_role.lambda_fun.name
  policy = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

#creating instance profile no need because lambda directly assume the role and ec2 needs the instance profile

#creating lambda function
resource "aws_lambda_function" "lambda_func" {
   function_name = var.function_name
   runtime = var.lambda_runtime
   handler = var.lambda_handler
   role = aws_iam_role.lambda_fun.arn
   
   filename         = var.lambda_zip_file
   source_code_hash = filebase64sha256(var.lambda_zip_file)
}

  
