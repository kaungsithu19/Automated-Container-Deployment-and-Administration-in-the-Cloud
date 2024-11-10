# Docker Installation and Configuration with Ansible

This README explains how the Ansible playbook automates the process of installing and configuring Docker on an Ubuntu server. 

## Overview

This playbook is designed to:
1. Update and upgrade apt packages on the server.
2. Install the necessary packages and prerequisites.
3. Add Docker’s official repository and GPG key.
4. Install Docker.
5. Start Docker as a service and enable it to start on boot.
6. Verify the Docker installation and display the Docker version.

The playbook uses simple and effective Ansible tasks to set up Docker on a remote Ubuntu server.

## Playbook Breakdown

1. **Update and Upgrade Packages**
   - The first task updates the package cache and upgrades the installed packages. This ensures that the server is using the latest versions of the packages, making it more secure and stable.

2. **Install Prerequisites**
   - The second task installs essential tools needed to manage packages securely. These tools include:
     - `apt-transport-https`: Allows apt to transfer files over HTTPS.
     - `ca-certificates`: Helps verify secure connections.
     - `curl`: A command-line tool for transferring data.
     - `software-properties-common`: Adds the ability to manage software sources.

3. **Add Docker’s GPG Key**
   - This step adds Docker’s official GPG key to the server. The GPG key is used to verify the authenticity of packages from the Docker repository.

4. **Add Docker Repository**
   - Here, we add Docker’s official repository to the server. This allows us to download the latest Docker packages directly from Docker.

5. **Install Docker**
   - In this step, Docker itself is installed. The playbook also updates the package cache to ensure the latest version of Docker is installed.

6. **Start Docker and Enable on Boot**
   - This task ensures that Docker starts immediately and that it will start automatically whenever the server restarts.

7. **Verify Docker Installation**
   - Finally, we check that Docker was installed successfully by running `docker --version`. The playbook captures this output and displays it as a message.

## Usage

To run this playbook, make sure you have:
- Ansible installed.
- An inventory file with the server information, with `aws` as the host name.

Run the playbook with:
```bash
ansible-playbook -i inventory_file playbook.yml
```

This command will execute each task in the playbook, setting up Docker on the server.

