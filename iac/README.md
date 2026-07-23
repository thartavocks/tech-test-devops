# Terraform Infrastructure

This directory contains the Terraform configuration used to provision the required infrastructure on Google Cloud Platform (GCP) for the technical assessment.

## Resources

The following resources are provisioned:

- VPC Network
- Public Subnet
- Private Subnet
- Cloud SQL for PostgreSQL
- Cloud Run Service

## Prerequisites

- Terraform >= 1.5
- Google Cloud SDK (gcloud)
- A GCP Project with billing enabled
- A service account or authenticated user with sufficient permissions

## Files

| File | Description |
|------|-------------|
| provider.tf | Terraform provider configuration |
| variables.tf | Input variables |
| network.tf | VPC and subnet configuration |
| cloudsql.tf | Cloud SQL instance, database, and user |
| cloudrun.tf | Cloud Run service deployment |
| outputs.tf | Terraform outputs |

## Usage

Initialize Terraform:

```bash
terraform init
```

Validate configuration:

```bash
terraform validate
```

Preview the execution plan:

```bash
terraform plan
```

Apply the configuration:

```bash
terraform apply
```

Destroy the infrastructure:

```bash
terraform destroy
```

## Notes

Before running Terraform, create a `terraform.tfvars` file based on `terraform.tfvars.example` and update it with your GCP project information.