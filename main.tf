# Proxmox Full-Clone
# ---
# Create a new VM from a clone

resource "proxmox_vm_qemu" "vm-resource-demo1" {

    # VM General Settings
    target_node = "pve"
    vmid = "200"
    name = "ansible-sudio"
    desc = "Description"

    # VM Advanced General Settings
    onboot = false

    # VM OS Settings
    clone = "alpine-template-vm"

    # VM System Settings
    agent = 1

    # VM CPU Settings
    cores = 1
    sockets = 1
    cpu = "host"    

    # VM Memory Settings
    memory = 1024

    # VM Network Settings
    network {
        bridge = "vmbr0"
        model  = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "scsi"
        size = "32G"
        ssd = 0
    }

    # VM Cloud-Init Settings
    os_type = "cloud-init"

    # (Optional) IP Address and Gateway
    ipconfig0 = "ip=192.168.2.7/24,gw=192.168.2.1"

    # If your packer image template already has a user and ssh key created then only use this step
    # to create an additional user and ssh key pair

    # (Optional) Default User
    ciuser = "root"
    # (Optional) Add your SSH KEY

    sshkeys = <<EOF
    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQD34RVy9lKofzrLwVbGVo6oiEr9vxqAq/MSKPQ8BAuyne4+h97h/vNM/vEj9Q/s6NJMEJkC8zx+qBvJOAlGE9f2ZcaJedBjINIpnQHpDdb1xy5ah7w1iR3tOSXwGgP2on/o8NiUGuMGYrLS+Khu104goCK+opmzNWDOOtsdDXEkTetrV/MOZVwKRQueqAYzGEwR4uwgSqw75stgA3kQMzgvBR4FQqbVBEzx1YYWWlZbnLTwZi204bfgJWfYIjnxsi9WN/zFd6LPMWQBiO6oKSbmJWJDDKpUpwgqY/UD4N7TeGlkP8g7di0Cg2MJUVZseW46O4QPtbrQOFAt1BeyAK1B/+fHUFr6njKBwIEyFSOa/HxkOpaVMX6CoXo/zvW9b9/Coty3ZGnmTGBV3WUjzTo+Rwrc1HKlDoCjxlVhvqpbOKf+XdCqFxCN9Lpl3ojtJeZsE7s1cS0tvTthdO6C9PM+m/POEXrpIJTHfYZw1oflsjcRnfX03/lFwMX8wDCGJxc= tyx@iMac.fritz.box
    EOF

}
