````markdown
# GCP DevOps Technical Test

This repository contains the implementation for the DevOps Engineer technical
test focused on Google Cloud Platform (GCP).

The project covers Infrastructure as Code (IaC), CI/CD automation,
monitoring & alerting, and operational troubleshooting practices.

---

## Repository Structure

```text
.
├── iac/
│   ├── Terraform configuration
│   ├── VPC & Networking
│   ├── Cloud SQL PostgreSQL
│   └── Cloud Run deployment
│
├── cicd/
│   ├── Jenkinsfile
│   └── app/
│       └── Dockerfile
│
├── docs/
│   ├── theoretical-answers.md
│   ├── alert-setup.md
│   └── troubleshooting-case-study.md
│
└── README.md
````

---

# Project Overview

The implementation demonstrates a complete DevOps workflow on Google Cloud:

```
Source Code
     |
     v
CI/CD Pipeline
(Jenkins)
     |
     v
Container Build
(Docker)
     |
     v
Artifact Registry
     |
     v
Cloud Run Deployment
     |
     v
Monitoring & Alerting
(Prometheus / Alertmanager)
```

---

# Implementation Summary

## 1. Infrastructure as Code

Location:

```
iac/
```

Tools:

* Terraform

Provisioned resources:

* Google Cloud VPC
* Public & Private Subnet
* Cloud SQL PostgreSQL Instance
* Cloud Run Application

Terraform provides:

* Infrastructure version control
* Repeatable deployment
* Automated provisioning
* Environment consistency

---

## 2. CI/CD Pipeline

Location:

```
cicd/
```

Pipeline Flow:

```
Git Push (main branch)
        |
        v
Jenkins Pipeline
        |
        v
Build Docker Image
        |
        v
Push Image to Artifact Registry
        |
        v
Deploy Application to Cloud Run
```

Pipeline responsibilities:

* Source code checkout
* Container image build
* Image publishing
* Automated Cloud Run deployment

---

## 3. Monitoring & Alerting

Location:

```
docs/alert-setup.md
```

Monitoring approach:

* Prometheus monitoring
* HTTP health check endpoint (`/healthz`)
* Alert rule configuration
* Alertmanager notification

Monitoring flow:

```
Cloud Run
    |
    v
/healthz Endpoint
    |
    v
Prometheus Probe
    |
    v
Alert Rule
    |
    v
Email / Slack Notification
```

Alert condition:

```
Health check failure
+
Duration > 5 minutes
=
Trigger Alert
```

---

## 4. Documentation

Location:

```
docs/
```

Contains:

| Document                      | Description                              |
| ----------------------------- | ---------------------------------------- |
| theoretical-answers.md        | Answers for theoretical DevOps questions |
| alert-setup.md                | Monitoring and alerting configuration    |
| troubleshooting-case-study.md | Production troubleshooting approach      |

---

# Deployment Requirement

## Prerequisites

Before running the deployment:

* Google Cloud Project
* Terraform installed
* Google Cloud CLI installed
* Docker installed
* Jenkins server with required credentials

## Infrastructure Deployment

Navigate to:

```bash
cd iac
```

Initialize Terraform:

```bash
terraform init
```

Review changes:

```bash
terraform plan
```

Deploy infrastructure:

```bash
terraform apply
```

---

## CI/CD Deployment

Configure Jenkins with:

* GCP Service Account credentials
* Artifact Registry access
* Cloud Run deployment permission

Pipeline will automatically execute when changes are pushed to:

```
main branch
```

---

# Security Considerations

Implemented security practices:

* Least privilege IAM permissions
* Service Account based authentication
* Container image based deployment
* Infrastructure managed through code
* Secrets stored outside source code

---

# Author

Razdhan Hadi

DevOps Engineer Candidate

```
