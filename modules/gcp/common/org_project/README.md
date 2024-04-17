# Summary
The organization project will create a project directly within the organization not within a folder.

## Required Enabled APIs
This api is required to be enabled in the project where the service account is.
- cloudbilling.googleapis.com
- cloudresourcemanager.googleapis.com

## IAM Requirements
In order to run terraform apply to create a new GCP project, the user or service account will require the following role:

`roles/resourcemanager.projectCreator`



### Permissions
The more granular minimum permissions required are the following
- billing.resourceAssociations.create
- resourcemanager.projects.create
