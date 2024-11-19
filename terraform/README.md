
# Automated Container Deployment and Administration in the Cloud: Terraform Setup

This part of the project provisions the cloud infrastructure required for deploying a Docker container using **Terraform** on AWS. The configuration includes setting up a VPC, subnet, internet gateway, security groups, a key pair, and an EC2 instance.

## Repository Structure

```
terraform/
├── provider.tf           # AWS provider configuration
├── main.tf               # Main Terraform configuration for infrastructure resources
├── datasources.tf        # Data sources for fetching AMI
├── terraform.tfstate     # Terraform state file (automatically generated)
├── terraform.tfstate.backup # Backup of Terraform state (automatically generated)
```

---

## Prerequisites

- **Terraform** (v1.0+)
- AWS CLI configured with credentials and profiles.
- A valid public SSH key for accessing the EC2 instance.
- Access to an AWS account with permissions to create resources.

---

## Configuration Details

### `provider.tf`

Defines the AWS provider settings.  
**Reminder:**
- Update the `region` field to your preferred AWS region.
- Update `shared_credentials_files` with the correct path to your AWS credentials file.
- Ensure the `profile` matches your AWS CLI profile name.

Example:
```
region                   = "eu-west-1"
shared_credentials_files = ["C:/Users/User/.aws/credentials"] # Change path if necessary
profile                  = "kaung" # Update to your AWS CLI profile
```

---

### `main.tf`

Contains the infrastructure configuration for:
- **VPC**: A custom virtual network (`172.168.0.0/16`).
- **Subnet**: A public subnet (`172.168.1.0/24`).
- **Internet Gateway**: For external access.
- **Route Table**: Routing to the internet.
- **Security Group**: Allows inbound SSH (port 22) and HTTP (port 80) traffic.
- **Key Pair**: SSH key pair for authentication.
- **EC2 Instance**: Ubuntu server for running Docker containers.

**Reminder:**
- Replace the `public_key` path in `aws_key_pair` with the location of your public SSH key:
  ```
  public_key = file("C:/Users/User/.ssh/kaungkey0.pub") # Update this path
  ```
- Ensure the key name (`kaungkey0`) is unique in your AWS account.

---

### `datasources.tf`

Fetches the latest Ubuntu 24.04 AMI for the EC2 instance.  
**Reminder:**
- If using a different Ubuntu version or a custom AMI, update the `values` in the `filter` block:
  ```
  values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  ```
  Replace `099720109477` with the appropriate owner ID if using a different image.

---

## How to Use

1. **Initialize Terraform:**
   Navigate to the `terraform/` directory and run:
   ```
   terraform init
   ```

2. **Plan Infrastructure:**
   Generate an execution plan to verify the configuration:
   ```
   terraform plan
   ```

3. **Apply Configuration:**
   Deploy the infrastructure:
   ```bash
   terraform apply
   ```
   Type `yes` when prompted to confirm.

4. **Access the EC2 Instance:**
   Use your private key to SSH into the instance:
   ```bash
   ssh -i "C:/Users/User/.ssh/kaungkey0" ubuntu@<EC2_PUBLIC_IP>
   ```
   Replace `<EC2_PUBLIC_IP>` with the public IP of the EC2 instance.

---

## Cleanup

To delete the resources and avoid unnecessary costs:
```bash
terraform destroy
```
Type `yes` to confirm the deletion.

---

## Notes and Reminders

1. **Path Adjustments:**
   - Ensure file paths (e.g., credentials, SSH key) match your system configuration.

2. **AWS Resource Limits:**
   - Check your AWS account limits to ensure you can create the required resources.

3. **State Management:**
   - The `terraform.tfstate` file contains sensitive information about your resources. Do not share it publicly.

---

## Author

**Kaung Sithu**  
GitHub: [kaungsithu19](https://github.com/kaungsithu19)

For any questions or feedback, feel free to reach out!
```

This README ensures clarity about the code and includes reminders for making necessary adjustments. Let me know if more refinements are needed!
