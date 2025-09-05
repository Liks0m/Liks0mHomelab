terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc04"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://100.124.250.20:8006/api2/json"
  api_token = var.api_token
  insecure  = true
  ssh {
    agent       = false
    username    = "Liks0m"
    private_key = var.private_key
  }
}


resource "proxmox_virtual_environment_vm" "AlmaLinux_vm" {
  name      = "test-AlmaLinux"
  node_name = "Liks0mHomelab"
  vm_id     = 100
  initialization {
    user_account {
      username = "Liks0m"
      password = var.password
    }
  }

  disk {
    datastore_id = "local-lvm"
    file_id      = "local:iso/AlmaLinux-10.0-x86_64-boot.iso"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = 200
  }
}

