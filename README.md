# AKS Todo App Deployment with Terraform, Docker, and GitHub Actions

## Overview

This repository demonstrates a complete **Infrastructure as Code (IaC) and CI/CD workflow** to deploy a React-based Todo application on **Azure Kubernetes Service (AKS)**. The deployment process leverages:

* **Terraform** for provisioning a managed AKS cluster.
* **Docker** for containerizing the React Todo application.
* **GitHub Actions** for CI/CD to build, push Docker images, and deploy to the AKS cluster.
* **Kubernetes manifests** for deploying the app and exposing it via an Ingress to make it publicly accessible.

The app is live and accessible at: **[http://achinta.site](http://achinta.site)**

---

## Repository Structure

```
├── infra/                  # Terraform modules for AKS cluster provisioning
│   ├── aks/                 # Reusable modules created with for_each and map(object) for scale
│   ├── rg/
│   └── ENV/DEV/                # dev environment
├── todo-app/             # React Todo application
│   ├── Dockerfile
│   └── public/
│   └── src/
│   └── package.json
│   └── package-lock.json
├── manifests/              # Kubernetes YAML manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
├── .github/workflows/          # GitHub Actions CI/CD pipeline
│   └── main.yml
└── README.md
└── .gitignore
```

---

## Features & Design Choices

1. **Infrastructure as Code (IaC)**

   * Terraform modules are used to provision an **AKS cluster** with required networking and security settings. Used for_each with map(object) for easy replication of resources and less code modification.
   * This ensures **reproducibility** and **easy maintenance**.

2. **Containerization**

   * React Todo App is packaged into a Docker image.
   * Dockerfile optimized for smaller image size and faster build. Have used alpine image and multi stage docker file for optimization.

3. **Kubernetes Manifests**

   * Deployment with RollingUpdate strategy to ensure zero downtime and Load Balancer Service to expose the app externally ensures scalable, fault-tolerant deployment. 
   * Ingress is configured to expose the app publicly via `achinta.site`.

4. **CI/CD Pipeline**

   * GitHub Actions workflow automatically triggers on pushes to the `main` branch.
   * Workflow steps:

     1. Build the Docker image.
     2. Push it to Docker Hub.
     3. Deploy/Update the application on AKS using `kubectl`.

---

## How to Run

### Prerequisites

* [Terraform](https://www.terraform.io/downloads)
* Docker & Docker Hub account
* Github Account
* Create a Kubernetes namespace 'todo'

### Steps

Clone the repo: 
  git clone https://github.com/k8s-Project-Achinta/aks-assignment.git
  
1. **Provision AKS cluster using Terraform**

```bash
Update subscription id in infra/ENV/DEV/provider.tf file. Then, run below commands
cd infra/ENV/DEV
terraform init
terraform plan
terraform apply
```
2. **Setup service principle in azure to authenticate using OIDC and setup the secrets**

```bash
1. Create SP in azure and add a fredrated credential to authorize github action for azure login and aks login ,assign proper RBAC access to SP.
2. Add below secrets and values in your repo secrets in repo settings - see below image
3.Generate a PAT too in dockerhub and add that too in the repo setting secret
4. Similarly, add RG_NAME and AKS_NAME also in secrets
```
<img width="475" height="64" alt="image" src="https://github.com/user-attachments/assets/2718e96b-6091-4666-aac4-287a98262646" />

3. **Build and Push Docker Image and Deploy to AKS**

```bash
Update manifests/deployment.yaml and .github/workflows/main.yml with proper version for the app
```


4. **Access Application**
   Open: [http://achinta.site](http://achinta.site)

---

## CI/CD Workflow

The GitHub Actions workflow (`.github/workflows/deploy.yml`) automates:

* Building the Docker image for the React app.
* Pushing the image to Docker Hub.
* Deploying the new image to the AKS cluster using the Kubernetes manifests.

This ensures **continuous deployment** whenever a change is pushed to the `main` branch.

---

## Live Demo

**Todo App:** [http://achinta.site](http://achinta.site)

---

## Conclusion

This project demonstrates an **end-to-end cloud-native application deployment** with:

* Automated **cluster provisioning**
* Efficient **containerization**
* **Scalable Kubernetes deployment**
* **Fully automated CI/CD pipeline**

It is modular, maintainable, and follows best practices for modern DevOps workflows.
