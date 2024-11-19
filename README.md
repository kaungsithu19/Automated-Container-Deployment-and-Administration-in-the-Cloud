# Automated Container Deployment and Administration in the Cloud

This project demonstrates the use of automation tools to deploy a server with a Docker container running a sample application on cloud infrastructure. It integrates multiple tools, including **Terraform**, **Ansible**, **Docker**, and **GitHub Actions** for infrastructure provisioning, configuration management, and CI/CD pipeline implementation.



## Project Overview

The project is divided into four parts:

1. **Infrastructure Setup**  
   Automated provisioning of cloud infrastructure using Terraform.
   
2. **Configuration Management**  
   Automated configuration of the server environment using Ansible.
   
3. **Docker Container Deployment**  
   Deployment of a Dockerized web application on the provisioned server.

4. **CI/CD Pipeline Integration**  
   Implementation of a CI/CD pipeline using GitHub Actions to automate the build and deployment process.



## Repository Structure

```
Automated-Container-Deployment-and-Administration-in-the-Cloud/
├── terraform/
│   ├── datasources.tf
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfstate
│   ├── terraform.tfstate.backup
├── ansible/
│   ├── inventory/
│   │   ├── hosts
│   ├── playbook/
│   │   ├── Install_Docker.yml
│   ├── playbook1/
│       ├── Deploy_Docker_App.yml
│       ├── Flask/
│           ├── Dockerfile
│           ├── requirements.txt
│           ├── app.py
├── .github/
│   ├── workflows/
│       ├── Deploy_Docker_Container.yml
├── Dockerfile
├── requirements.txt
├── app.py
└── README.md
```

---

## Part 1: Infrastructure Setup

### Objective:
Provision cloud infrastructure to host a server using **Terraform**.

### Files:
- `terraform/datasources.tf`
- `terraform/main.tf`
- `terraform/provider.tf`

### Tasks:
1. Provisioned an **AWS EC2 instance** to host the Docker container.
2. Configured networking and security groups for secure access.
3. Generated a diagram of the deployed infrastructure (attached in project documentation).

### How to Run:
1. Navigate to the `terraform/` directory.
2. Initialize Terraform:  
   ```bash
   terraform init
   ```
3. Apply the configuration:  
   ```bash
   terraform apply
   ```

---

## Part 2: Configuration Management

### Objective:
Automate server configuration using **Ansible**.

### Files:
- `ansible/inventory/hosts`
- `ansible/playbook/Install_Docker.yml`

### Tasks:
1. Installed and configured Docker on the EC2 instance.
2. Ensured Docker starts automatically on boot.

### How to Run:
1. Navigate to the `ansible/` directory.
2. Run the Ansible playbook:  
   ```bash
   ansible-playbook -i inventory/hosts playbook/Install_Docker.yml
   ```

---

## Part 3: Docker Container Deployment

### Objective:
Deploy a Dockerized web application on the provisioned server.

### Files:
- `ansible/playbook1/Deploy_Docker_App.yml`
- `ansible/playbook1/Flask/Dockerfile`
- `ansible/playbook1/Flask/requirements.txt`
- `ansible/playbook1/Flask/app.py`

### Tasks:
1. Built a Docker image using the provided `Dockerfile`.
2. Deployed a **Flask** application to the server.

### How to Run:
1. Navigate to the `ansible/` directory.
2. Run the playbook to deploy the container:  
   ```bash
   ansible-playbook -i inventory/hosts playbook1/Deploy_Docker_App.yml
   ```

---

## Part 4: CI/CD Pipeline Integration

### Objective:
Implement a CI/CD pipeline to automate the build and deployment process using **GitHub Actions**.

### Files:
- `.github/workflows/Deploy_Docker_Container.yml`
- `Dockerfile`
- `requirements.txt`
- `app.py`

### Tasks:
1. Configured GitHub Actions to trigger on code changes.
2. Automated building and deploying the Docker container to the server.

### How to Run:
1. Push changes to the GitHub repository.
2. The GitHub Actions workflow automatically triggers, builds, and deploys the container.

---

## Sample Application

The project includes a basic **Flask web application** with the following structure:
- `app.py`: Main application file.
- `requirements.txt`: Python dependencies for Flask.

---

## Key Features

- **Infrastructure as Code (IaC)** with Terraform for scalable and repeatable deployments.
- **Configuration Management** with Ansible to automate server setup.
- **Containerization** with Docker for efficient application deployment.
- **Continuous Integration/Continuous Deployment (CI/CD)** with GitHub Actions for automated workflows.

---

## Prerequisites

- **Terraform** (v1.0+)
- **Ansible** (v2.9+)
- **AWS CLI** (for managing AWS resources)
- **Docker** (v20.10+)
- **Python** (v3.8+)

---

## How to Clone and Use This Project

1. Clone the repository:
   ```bash
   git clone https://github.com/kaungsithu19/Automated-Container-Deployment-and-Administration-in-the-Cloud.git
   ```
2. Follow the instructions in each part to execute the automation workflows.

---

## Future Improvements

- Integration with additional cloud platforms (e.g., GCP, Azure).
- More robust CI/CD pipelines with advanced testing.
- Multi-environment support for production and staging.

---

## Author

**Kaung Sithu**  
GitHub: [kaungsithu19](https://github.com/kaungsithu19)

For questions or feedback, feel free to reach out via the **Contact** section in the repository.

---

Let me know if you need further modifications!
