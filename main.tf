module "vpn" {
  source  = "modules/vpn"
  token   = "x"
  image   = "centos-7-x64"
  name    = "vpn-server"
  region  = "FRA1"
  size    = "s-1vcpu-1gb"
  ssh_fingerprint = "x"
}