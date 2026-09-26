# AWS Infrastructure as Code (Terraform)

## Overview
This repository contains Infrastructure as Code (IaC) written in Terraform to provision scalable, modular, and secure AWS resources.

It demonstrates both standalone resource provisioning and a reusable custom child module (`./aws_infra`) that deploys isolated **Development (`dev`)**, **Staging (`stg`)**, and **Production (`prd`)** environments simultaneously.

## Architecture & Key Features
* **Multi-Environment Modular Design:** Uses `main.tf` to call the custom `./aws_infra` module across three environments (`dev-app`, `stg-app`, and `prd-app`) by dynamically passing variables for `my-env`, `instance_type` (`t3.micro`), `ami_id` (`ami-0e5497a77ef21b5ac`), and `instance_count` (`1`).
* **Compute:** Provisions AWS EC2 instances via standalone configuration (`ec2.tf`) and modular configuration (`aws_infra/myinstance.tf`) for scalable workloads.
* **Storage:** Deploys Amazon S3 buckets via `s3.tf` and `aws_infra/my_bucket.tf` for secure object storage.
* **Database & State Management:** Integrates Amazon DynamoDB (`dynamodb.tf` and `aws_infra/my.table.tf`) for NoSQL data handling and Terraform state locking.
* **Security & Git Hygiene:** Enforces strict credential management via local AWS CLI configuration and uses `.gitignore` to exclude local `.tfstate` files, ensuring zero secret leakage.

## Repository Structure
* **`main.tf`:** Root orchestration file that invokes the `./aws_infra` module for `dev`, `stg`, and `prd` environments.
* **`aws_infra/`:** Custom reusable module containing parameterized definitions for EC2 (`myinstance.tf`), S3 (`my_bucket.tf`), DynamoDB (`my.table.tf`), and module inputs (`variables.tf`).
* **`ec2.tf`, `s3.tf`, `dynamodb.tf`:** Foundational root-level resource definitions for compute, storage, and state management.
* **`terraform.tf`, `variables.tf`, `outputs.tf`:** Provider configurations, root input variables, and output values.

## How to Run
1. Clone this repository to your local machine.
2. Ensure the AWS CLI is configured locally with your IAM credentials.
3. Initialize the working directory and load the `./aws_infra` module:
   `terraform init`
4. Review the infrastructure execution plan:
   `terraform plan`
5. Apply the configuration to your AWS account:
   `terraform apply`
