# VM resource definition for creating a VM from a template
resource "proxmox_vm_qemu" "vm_from_template" {
  # VM General Settings
  name        = "demo"  # Name of the new VM
  target_node = "hung99"                  # Target node name (change to your node name)
  vmid        = 201                    # Optional: Specific VM ID (remove to auto-assign)
  
  # Clone settings
  clone       = "VMTEST"        # Name of your template VM
  full_clone  = true                   # true for full clone, false for linked clone
  
  # VM System Settings
  cores       = 4                      # CPU cores
  sockets     = 1                      # CPU sockets
  memory      = 2048                   # Memory in MB
  
  # VM Network Settings
#  network {
#    model     = "virtio"
#    bridge    = "vmbr0"
#  }
  
  # VM Disk Settings
  # If you want to use the template's disk and resize it:
#  disk {
 #   storage   = "local-lvm"            # Storage name where the disk will be created
 #   size      = "40G"                  # New disk size
#    type      = "scsi"                 # Disk type (scsi, virtio, etc.)
 # }
  
  # Cloud-Init Settings (if your template uses cloud-init)
  # Uncomment and modify if needed
  os_type     = "cloud-init"           # Enables cloud-init configuration
  ipconfig0   = "ip=dhcp"              # or static IP like "ip=192.168.1.100/24,gw=192.168.1.1"
  ciuser     = "hung"       # Override default cloud-init user
  cipassword = "hung"       # Override default cloud-init password
  # sshkeys    = "ssh-rsa AAAAB3NzaC1yc2E..."
  
  # Additional Settings
  agent       = 1                      # QEMU Guest Agent (1 = enabled, 0 = disabled)
  onboot      = true                   # Start on boot
}