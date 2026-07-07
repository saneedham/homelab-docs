# Homelab Documentation

This repository holds markdown documentation for all homelab projects, configurations, and rules.

## Rules

1. Everything must be documented in markdown.
2. A central documentation repository will be created including system configurations and projects.
3. Project documentation will also be kept alongside the project.

> *This is the start of the documentation. Add more sections as the lab grows.*


4. System configuration: Where possible, prefer a dot‑files style of configuration management.

*Explanation:* Store config snippets in your dot‑files repo and symlink or use a tool such as GNU Stow or home‑bloat to apply them to each host.


5. Deploy system configuration with Ansible (and Ansible Roles).

*Explanation:* Use Ansible inventories, playbooks, and role conventions to provision and maintain each host. Keep the roles reusable across environments.

