# Create a new Web Droplet in the nyc2 region
provider "digitalocean" {
  token = "${var.token}"
}
# Create droplet based on distributed centos image
locals {
  env="${terraform.workspace}"
}

resource "digitalocean_droplet" "vpn" {
    image               = "${var.image}"
    name                = "${local.env}-${var.name}-${var.image}-${var.size}"
    region              = "${var.region}"
    size                = "${var.size}"
    ssh_keys            = ["${var.ssh_fingerprint}"]  
    private_networking  = "${var.private_networking}"

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

resource "digitalocean_firewall" "vpn" {
    name = "${digitalocean_droplet.vpn.name}-firewall"
    droplet_ids = ["${digitalocean_droplet.vpn.id}"]

    inbound_rule = [
        {
            protocol = "tcp"
            port_range = "22"
        },
        {
            protocol = "tcp"
            port_range = "80"
        },
        {
            protocol = "tcp"
            port_range = "443"
        },
        {
            protocol = "udp"
            port_range = "1194"
        }        
    ]

    outbound_rule = [
        {
            protocol = "tcp"
            port_range = "53"
        },
        {
            protocol = "udp"
            port_range = "53"
        },
        {
            protocol = "udp"
            port_range = "1194"
        }  
    ]
}