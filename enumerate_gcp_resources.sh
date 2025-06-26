#!/bin/bash

# GCP Resource Enumerator Script
# Enumerates various GCP resources using REST APIs.
# Requires: curl, jq

# Set your GCP OAuth2 Access Token here or export it in your environment
TOKEN="${TOKEN:-<access-token>}"

# Your GCP Project ID
PROJECT="${PROJECT:-<project-id>}"

# Location/region for regional APIs (e.g., us-central1)
LOC="${LOC:-<location>}"

# Authorization header
AUTH="Authorization: Bearer $TOKEN"

# Function to query GCP APIs and pretty-print JSON output
function try() {
    echo -e "\n🔍 Checking: $1"
    curl -s -H "$AUTH" "$2" | jq
}

# Enumerate GCS Buckets
try "GCS Buckets" "https://storage.googleapis.com/storage/v1/b?project=$PROJECT"

# Enumerate BigQuery Datasets
try "BigQuery Datasets" "https://bigquery.googleapis.com/bigquery/v2/projects/$PROJECT/datasets"

# Enumerate Cloud Functions
try "Cloud Functions" "https://cloudfunctions.googleapis.com/v1/projects/$PROJECT/locations/-/functions"

# Enumerate Secrets Manager Secrets
try "Secrets Manager" "https://secretmanager.googleapis.com/v1/projects/$PROJECT/secrets"

# Enumerate Service Accounts
try "Service Accounts" "https://iam.googleapis.com/v1/projects/$PROJECT/serviceAccounts"

# Enumerate Compute Engine Instances (all regions)
try "Compute Instances" "https://compute.googleapis.com/compute/v1/projects/$PROJECT/aggregated/instances"

# Enumerate Cloud Run Services
try "Cloud Run Services" "https://run.googleapis.com/v1/projects/$PROJECT/locations/$LOC/services"

# Enumerate Vertex AI Models
try "Vertex AI Models" "https://$LOC-aiplatform.googleapis.com/v1/projects/$PROJECT/locations/$LOC/models"

# Enumerate Vertex AI Tensorboards
try "Vertex AI Tensorboards" "https://$LOC-aiplatform.googleapis.com/v1/projects/$PROJECT/locations/$LOC/tensorboards"

# Enumerate Analytics Hub Listings
try "Analytics Hub Listings" "https://analyticshub.googleapis.com/v1/projects/$PROJECT/locations/$LOC/listings"

# Get IAM Policy
try "IAM Roles and Policies" "https://cloudresourcemanager.googleapis.com/v1/projects/$PROJECT:getIamPolicy"
