terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
      version = "~> 0.82.1"
    }
  }
}



resource "proxmox_virtual_environment_vm" "centos_vm" {

  name      = "test-centos"
  node_name = "Liks0mhomelab"


  initialization {
    user_account {
      username = "Liks0m"
      password = var.password 
    }
  }

provider "proxmox" {
    endpoint = "https://192.168.10.191:8006"
    api_token = var.api_token
    insecure = true
    ssh {
      agent = true
      username = "Liks0m"
    }
  }



  disk {
    datastore_id = "local-lvm"
    file_id = "local:iso/CentOS-Stream-10-latest-x86_64-dvd1.iso"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 20
  }
}

