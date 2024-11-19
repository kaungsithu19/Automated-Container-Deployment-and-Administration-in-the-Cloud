# Automated Container Deployment: Deploying a Flask App with Docker

This part of the project focuses on automating the deployment of a Docker container that runs a simple Flask application. Using **Ansible**, the tasks include transferring application files to the server, building a Docker image, and running the container.



## Repository Structure

```
ansible/
├── playbook1/
│   ├── Deploy_Docker_App.yml   # Ansible playbook to deploy the Flask app
│   ├── Flask/
│       ├── Dockerfile          # Dockerfile to containerize the Flask app
│       ├── requirements.txt    # Python dependencies for the Flask app
│       ├── app.py              # Flask application code
```

---

## Prerequisites

- **Ansible** installed on your local machine.
- An EC2 instance with Docker pre-installed (from Part 2 of the project).
- SSH access to the EC2 instance (ensure private key and inventory file are correctly configured).

---

## Configuration Details

### Ansible Playbook: `Deploy_Docker_App.yml`

This playbook performs the following tasks:
1. **Copy Application Files:** Transfers `Dockerfile`, `requirements.txt`, and `app.py` from the local machine to the EC2 instance.
2. **Build Docker Image:** Creates a Docker image named `flask` using the uploaded files.
3. **Stop and Remove Existing Container:** Stops and removes any existing container named `app_container` (if it exists).
4. **Run Docker Container:** Deploys a new container named `app_container`, exposing the app on port `443`.

**Reminder:**
- Update the `src` path in the `copy` task to reflect the correct location of your application files on your local machine:
  ```yaml
  src: "/home/kaung/ansible/playbook1/Flask/{{ item }}"  # Adjust if needed
  ```

---

### Dockerfile

Defines the Flask application containerization process:
1. **Base Image:** Python 3.8 slim image.
2. **Dependencies:** Installs Python dependencies listed in `requirements.txt`.
3. **Application Code:** Copies `app.py` to the container.
4. **Environment Variable:** Sets `FLASK_APP` to `app.py`.
5. **Command:** Runs the Flask app, exposing it on port `5000`.

Example `Dockerfile`:
```dockerfile
FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY app.py .

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]
```

---

### Flask Application Code: `app.py`

A simple Flask application with one route:
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

1. **Set Up Inventory File:**
   Ensure your `hosts` file is configured with the correct IP address and SSH private key for the EC2 instance:
   ```ini
   [aws]
   <EC2_PUBLIC_IP> ansible_ssh_user=ubuntu ansible_ssh_private_key_file=/path/to/private_key
   ```

2. **Run the Playbook:**
   Execute the playbook to deploy the Flask app:
   ```bash
   ansible-playbook -i inventory/hosts playbook1/Deploy_Docker_App.yml
   ```

3. **Verify Deployment:**
   - Access the Flask app in your browser at `https://<EC2_PUBLIC_IP>`.
   - Ensure port `443` is open in your security group.

---

## Notes and Reminders

1. **Adjust Paths:** Ensure the `src` in the `copy` task matches your local file structure.
2. **Security Group:** Verify that port `443` is open for incoming traffic to access the Flask app.
3. **Docker Image Naming:** The image name (`flask`) and container name (`app_container`) can be customized if needed.

---

## Troubleshooting

- **Docker Command Issues:** Ensure Docker is installed and running on the EC2 instance.
- **Port Conflicts:** Check for conflicting services using the same port.

---

## Author

**Kaung Si Thu**  
GitHub: [kaungsithu19](https://github.com/kaungsithu19)

For feedback or assistance, feel free to reach out!

This README explains each component of Part 3 in detail, highlights potential points of adaptation, and ensures clarity for anyone reviewing or using the project. Let me know if further modifications are needed!
