# Ansible Inventory File: Hosts

This file defines the inventory for Ansible to connect to the AWS EC2 instance for automation tasks.

---

## File Structure

```plaintext
ansible/
├── inventory/
    ├── hosts   # Ansible inventory file
```

---

## Hosts File Configuration

```ini
[aws]
3.249.135.76 ansible_user=ubuntu ansible_ssh_private_key_file=~/.ssh/kaungkey0
```

### Explanation:

- **Group:** `[aws]` defines the host group for the EC2 instance.
- **IP Address:** `3.249.135.76` is the public IP of the EC2 instance.
- **User:** `ansible_user=ubuntu` specifies the username for SSH.
- **SSH Key:** `ansible_ssh_private_key_file=~/.ssh/kaungkey0` points to the private key used for authentication.

---

## Reminder

- **Update IP Address:** Replace `3.249.135.76` with the public IP of your EC2 instance.
- **Verify Key Path:** Ensure the private key path (`~/.ssh/kaungkey0`) is correct and accessible.
- **Permissions:** Ensure the private key file has proper permissions (`chmod 600`).

---

## Usage

Run Ansible playbooks using this inventory file:
```bash
ansible-playbook -i inventory/hosts <playbook_name>.yml
```

---

## Author

**Kaung Si Thu**  
GitHub: [kaungsithu19](https://github.com/kaungsithu19)

This README ensures clarity for anyone using the `hosts` file. Let me know if adjustments are needed!
