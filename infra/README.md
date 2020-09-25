# Incomi Infrastructure

_All files in this folder and its subfolders are owned by Meatasit Karakate_

## Overview

- Frontend: Use `nuxt generate` to create static HTML and JS files which are later deployed on Firebase
- Backend: Create a Docker image that can be deployed on a Kubernetes cluster

## Prerequisites

- GitHub Account
- Docker
- Docker Compose
- GCP Account
- A GCP Service Account with the Storage Admin and GKE Admin permissions
- A domain name

## Instructions

- Link your GCP Account to Firebase
- Create a VM on Google Compute Engine and install `mysql-client` on it
- Create a MySQL instance on Google Cloud SQL and set the credentials to `root:root_pass`
- Create a Kubernetes cluster on GKE with the default settings
- Connect to GCP Cloud Shell and run `helm install nginx-ingress stable/nginx-ingress`
- Run `kubectl -f apply "filename"` for every of the files in this directory (k8s resource files can be regenerated from `docker-compose-prod.yml`)

### Required GitHub Secrets

Go to the settings -> secrets page of the GitHub repository and set all of these variables

- `API_URL=https://<your domain name>` or `API_URL=https://dm12.club/`
- `HOST=<ip of your GCP VM>`
- `USERNAME=<your username on your GCP vm>` or `USERNAME=incomi`
- `KEY=<the private key for your VM>`
- `DATABASE_IP=<ip of your MySQL instance>`
- `FIREBASE_TOKEN=<your firebase token>`
- `GCR_JSON=<the contents of the key file of your GCP Service Account>`
- `SECRET_KEY_BASE=<a key that can be generated from the development environment by running docker-compose run --rm back rails secrets:setup>`