### Terraform workspaces are a feature that allows you to manage multiple distinct sets of infrastructure resources within a single Terraform configuration. Workspaces enable you to maintain separate environments (such as DEVELOPMENT, STAGING, and PRODUCTION) using the same Terraform configuration files, with each workspace having its own state and resources. This promotes isolation, scalability, and ease of management for different environments or deployments.

# Create a new workspace
terraform workspace new dev

# Switch to the "dev" workspace
terraform workspace select dev

# Show in which Workspace you are
terraform workspace show

# Apply changes to resources in the "dev" workspace
terraform apply

# Switch to the "prod" workspace
terraform workspace select prod

# Apply changes to resources in the "prod" workspace
terraform apply
