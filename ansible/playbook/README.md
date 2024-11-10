# Automated Installation of Docker on AWS EC2 Using Ansible

This project automates the installation and configuration of Docker on an AWS EC2 instance using Ansible. The automation ensures Docker is installed, configured to start on boot, and verified post-installation.

## Project Structure

```
project_root/
├── playbook/
│   └── Install_Docker.yml         
└── inventory/
    └── hosts                      
```

## Automation Flow

The following steps outline the setup and execution of this automation:

### Setting Up the EC2 Instance

1. Launch an EC2 instance on AWS (e.g., Ubuntu 20.04 LTS).
2. Make sure to keep the private key file used to create the instance for SSH access and Ansible connections.

### Inventory File Configuration

Configure the Ansible inventory file by adding the EC2 instance details, including its IP address, SSH user, and path to the private key.

Example `hosts` inventory file:

```ini
[aws] 
3.249.135.76 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/kaungkey0
```

### Ansible Playbook Structure

The `Install_Docker.yml` playbook automates Docker installation and configuration in five main steps:

1. **Package Update & Prerequisites**: Updates package cache and installs necessary prerequisites.
2. **GPG Key & Docker Repository**: Adds Docker's official GPG key and repository for secure installation.
3. **Docker Installation**: Installs the Docker Community Edition package.
4. **Service Configuration**: Starts Docker and configures it to start on boot.
5. **Verification**: Checks and confirms Docker installation.

## Running the Playbook

Execute the playbook using:

```bash
ansible-playbook -i /home/kaung/ansible/inventory/hosts /home/kaung/ansible/playbook/Install_Docker.yml
```

The playbook will connect to the specified EC2 instance, execute all tasks, and summarize the results upon completion.

## Troubleshooting Connection Issues

If you encounter connection errors, verify that the private key specified in the inventory file matches the one used to create the EC2 instance.

## Requirements

- **Ansible** installed on your local machine.
- **AWS EC2 Instance** running Ubuntu 20.04 (or a similar Linux distribution).
- **SSH Access** with the private key file from the original EC2 instance creation.

---
