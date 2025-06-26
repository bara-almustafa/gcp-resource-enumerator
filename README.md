# GCP Resource Enumerator

A Bash script to enumerate key Google Cloud Platform (GCP) resources using REST API calls authenticated via OAuth2 Bearer token.

## Features

- Enumerates:
  - Google Cloud Storage Buckets
  - BigQuery Datasets
  - Cloud Functions
  - Secrets Manager Secrets
  - Service Accounts
  - Compute Instances
  - Cloud Run Services
  - Vertex AI Models & Tensorboards
  - Analytics Hub Listings
  - IAM Roles & Policies

- Outputs JSON formatted results using `jq`.
- Simple and easy to modify script.

## Prerequisites

- Bash shell
- `curl` command-line tool
- `jq` for JSON formatting
- A valid OAuth2 Bearer token with required permissions
- Your GCP Project ID
- GCP Location (region) for regional services

## Usage

1. Clone this repo or copy the script:

   ```bash
   git clone https://github.com/yourusername/gcp-resource-enumerator.git
   cd gcp-resource-enumerator
