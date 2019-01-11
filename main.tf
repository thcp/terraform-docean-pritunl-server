variable "token" {}
variable "image" {}
variable "name" {}
variable "region" {}
variable "size" {}
variable "ssh_fingerprint" {}
variable "private_networking" {}

module "vpn" {
  source              = "modules/vpn"
  token               = "${var.token}"
  image               = "${var.image}"
  name                = "${var.name}"
  region              = "${var.region}"
  size                = "${var.size}"
  ssh_fingerprint     = "${var.ssh_fingerprint}"
  private_networking  = "${var.private_networking}"
}