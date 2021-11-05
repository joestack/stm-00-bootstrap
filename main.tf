terraform {
  required_version = ">= 0.12"
}


resource "null_resource" "foo" {
  
  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "echo $AWS_ACCESS_KEY_ID > ${path.root}/aws_access_key_id"
  }
  
  # locals {
  # #secret_access_key = var.aws_secret_access_key
  # #session_token = var.aws_session_token
  # access_key_id = file("${path.root}/aws_access_key_id")
  # }
}


resource "null_resource" "bar" {
  
  depends_on = [
    null_resource.foo
  ]

  triggers = {
    always_run = timestamp()
  }

  # provisioner "local-exec" {
  #   command = "echo $AWS_ACCESS_KEY_ID > ${path.root}/aws_access_key_id"
  # }
  
   locals {
  # #secret_access_key = var.aws_secret_access_key
  # #session_token = var.aws_session_token
   access_key_id = file("${path.root}/aws_access_key_id")
   }
}
