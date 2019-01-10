# digitalocean-pritunl-server
Terraform script to provision CentOS 7 Droplet on digital Ocean and install Pritunl Server.


## Usage
Update `main.tf` with:

`size`
More info: https://developers.digitalocean.com/documentation/changelog/api-v2/new-size-slugs-for-droplet-plan-changes/

`token` 
Can be found/created here: https://cloud.digitalocean.com/account/api/tokens

`ssh_fingerprint`
Can be found here: https://cloud.digitalocean.com/account/security

### Define your workspace
```terraform workspace new dev/prod
terraform get
```
### Plan and apply
```
teraform plan
terraform apply
```

