module "dev-app" {
    source = "./aws_infra"
my-env = "dev"
instance_type = "t3.micro"
ami_id = "ami-0e5497a77ef21b5ac"
instance_count = 1
}

module "stg-app" {
    source = "./aws_infra"
my-env = "stg"
instance_type = "t3.micro"
ami_id = "ami-0e5497a77ef21b5ac"
instance_count = 1
}

module "prd-app" {
    source = "./aws_infra"
my-env = "prd"
instance_type = "t3.micro"
ami_id = "ami-0e5497a77ef21b5ac"
instance_count = 1
}