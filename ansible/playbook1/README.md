# Part 3: Deploying Docker Container with Flask Application

This part of the project focuses on automating the deployment of a **Docker container** running a **Flask application** on an AWS EC2 instance using **Ansible**.


## Repository Structure

```plaintext
ansible/
├── playbook1/
    ├── Deploy_Docker_App.yml  # Ansible playbook to deploy the Docker container
    ├── Flask/
        ├── Dockerfile          # Dockerfile to containerize the Flask app
        ├── requirements.txt    # Python dependencies
        ├── app.py              # Flask application script
```

---

## Prerequisites

- **Docker** installed on the target EC2 instance (set up in Part 2).
- EC2 instance accessible via SSH and included in the `inventory` file.
- Ansible installed on your local machine.

---

## Configuration Details

### `Deploy_Docker_App.yml`

An **Ansible playbook** to:
1. Copy the Flask app files (`Dockerfile`, `requirements.txt`, and `app.py`) to the EC2 instance.
2. Build a Docker image for the Flask app.
3. Stop and remove any existing container with the same name (`app_container`).
4. Deploy the Docker container and expose it to the internet.

**Playbook Summary:**
- **Hosts:** `aws` (defined in `inventory/hosts`)
- **Tasks:**
  - Copy Flask application files to `/home/ubuntu/` on the EC2 instance.
  - Build the Docker image tagged as `flask`.
  - Remove any existing container named `app_container` (ignoring errors if not found).
  - Run the new container and map port `5000` of the application to port `443` of the instance.

**Reminder:**
- Update the `src` paths in the `copy` task if the source directory differs from:
  ```yaml
  /home/kaung/ansible/playbook1/Flask/
  ```
  Replace `/home/kaung/` with the actual path on your local machine.

---

### Flask Application Files

#### `Dockerfile`

Defines the steps to containerize the Flask application:
1. Use `python:3.8-slim` as the base image.
2. Set `/app` as the working directory.
3. Copy `requirements.txt` and install dependencies.
4. Copy `app.py` to the container.
5. Set the `FLASK_APP` environment variable.
6. Expose port `5000`.
7. Run the Flask app.

---

#### `requirements.txt`

Specifies the Python dependencies:
- Flask `2.0.1`
- Werkzeug (compatible version: `>=2.0.0` and `<2.1.0`)

---

#### `app.py`

A simple Flask app with one route (`/`) that returns a **"Hello, World!"** message:
```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, World! This is a sample Docker app."

if __name__ == "__main__":
    app.run(host="0.0.0.0")
```

---

## How to Use

1. **Set Up Inventory:**
   Ensure your EC2 instance is defined in `ansible/inventory/hosts` under the group `[aws]`.

2. **Run the Playbook:**
   Navigate to the `ansible/` directory and execute:
   ```bash
   ansible-playbook -i inventory/hosts playbook1/Deploy_Docker_App.yml
   ```

3. **Access the Application:**
   Open a web browser and navigate to:
   ```
   https://<EC2_PUBLIC_IP>
   ```
   Replace `<EC2_PUBLIC_IP>` with the public IP address of the EC2 instance.

---

## Cleanup

To stop and remove the Docker container:
```bash
docker stop app_container && docker rm app_container
```

To remove the Docker image:
```bash
docker rmi flask
```

---

## Notes and Reminders

1. **Path Adjustments:**
   - Update `src` paths in the `copy` task if your local directory differs.
   - Ensure the EC2 instance has sufficient permissions and resources.

2. **Firewall/Security Group:**
   - Ensure your AWS security group allows inbound traffic on port `443`.

3. **Ansible Debugging:**
   - Run with `-vvv` for detailed logs if you encounter errors:
     ```bash
     ansible-playbook -i inventory/hosts playbook1/Deploy_Docker_App.yml -vvv
     ```

---

## Author

**Kaung Si Thu**  
GitHub: [kaungsithu19](https://github.com/kaungsithu19)

For questions or feedback, feel free to reach out!

This README provides clarity on the deployment steps, file structure, and important reminders for adapting the configuration. Let me know if any additional details are needed!
