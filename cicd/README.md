# CI/CD Pipeline

This directory contains a Jenkins pipeline to build, push, and deploy a simple Node.js application to Google Cloud Run.

---

## Pipeline Flow

```text
GitHub Repository
        │
        ▼
     Jenkins
        │
        ▼
 Checkout Source Code
        │
        ▼
 Build Docker Image
        │
        ▼
 Authenticate to GCP
        │
        ▼
 Push Image to Artifact Registry
        │
        ▼
 Deploy to Cloud Run
```

---

## Directory Structure

```text
cicd/
├── Jenkinsfile
├── README.md
└── app/
    ├── Dockerfile
    ├── package.json
    ├── index.js
    └── .dockerignore
```

---

## Pipeline Stages

| Stage | Description |
|--------|-------------|
| Checkout | Retrieves the latest source code from the repository. |
| Build Docker Image | Builds a Docker image from the application source code. |
| Authenticate to GCP | Authenticates Jenkins using a Google Cloud service account. |
| Push Image | Pushes the Docker image to Google Artifact Registry. |
| Deploy to Cloud Run | Deploys the latest image to Google Cloud Run. |

---

## Prerequisites

- Jenkins
- Docker Engine
- Google Cloud SDK (`gcloud`)
- Google Artifact Registry
- Google Cloud Run
- Google Cloud Service Account (JSON Key)

---

## Jenkins Credential

The pipeline expects the following Jenkins credential:

| Credential ID | Type | Description |
|--------------|------|-------------|
| `gcp-service-account` | Secret File | Google Cloud Service Account JSON Key |

---

## Docker Image

The application image is tagged using the Jenkins build number.

Example:

```text
asia-southeast2-docker.pkg.dev/<PROJECT_ID>/hello-world/hello-world:<BUILD_NUMBER>
```

---

## Deployment Target

The pipeline deploys the latest container image to a Cloud Run service.

Deployment command:

```bash
gcloud run deploy hello-world \
  --image=<IMAGE> \
  --region=asia-southeast2 \
  --platform=managed \
  --allow-unauthenticated
```