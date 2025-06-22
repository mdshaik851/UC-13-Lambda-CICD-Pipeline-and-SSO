terraform {
  backend "s3" {
    bucket       = "uc-13-lambda-apigateway-cognito"
    key          = "uc-13-lambda-apigateway-cognito"
    region       = "us-west-1"
    encrypt      = true
    use_lockfile = true
  }
}