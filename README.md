# digitalocean-pritunl-server
Terraform script to provision CentOS 7 Droplet on digital Ocean and install Pritunl Server.


# Usage


Update `main.tf` vars with your settings relevant details can be found here:

### Size
- https://developers.digitalocean.com/documentation/changelog/api-v2/new-size-slugs-for-droplet-plan-changes/

### Token
- https://cloud.digitalocean.com/account/api/tokens

### ssh_fingerprint
- https://cloud.digitalocean.com/account/security


## Credential file
copy `secret.tvars.sample` to `secret.tvars` and add your API Token/ssh fingerprint
## Define your workspace
```terraform workspace new dev/prod
terraform workspace new <env>
terraform get
```
## Plan and apply
```
terraform plan -var-file="secrets.tfvars" -var-file="config.tfvars"
terraform apply -var-file="secrets.tfvars" -var-file="config.tfvars"
```

