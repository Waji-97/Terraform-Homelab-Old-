resource "proxmox_virtual_environment_vm" "example" {
  name      = "test-talos"
  node_name = "pve"
  started = false

  clone {
    vm_id = 3000
  }

  machine = "q35"
 
  memory {
    dedicated = 2048
  }

  cpu {
    cores = 2
  }

  efi_disk {
    datastore_id = "local-lvm"
    file_format  = "raw"
    type         = "4m"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.219.32/24"
        gateway = "192.168.219.1"
      }
    }
  }
}
