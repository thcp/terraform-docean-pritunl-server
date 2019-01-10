# Create a new Web Droplet in the nyc2 region
provider "digitalocean" {
  token = "${var.token}"
}
# Create droplet based on distributed centos image
locals {
  env="${terraform.workspace}"
}

resource "digitalocean_droplet" "vpn" {
    image   = "${var.image}"
    name    = "${local.env}-${var.name}-${var.image}-${var.size}"
    region  = "${var.region}"
    size    = "${var.size}"
    ssh_keys = ["${var.ssh_fingerprint}"]  


    provisioner "file" {
        source      = "modules/vpn/scripts"
        destination = "/tmp/scripts"
    }
    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/scripts/setup.sh",
        "/tmp/scripts/setup.sh",
      ]
    }    
}