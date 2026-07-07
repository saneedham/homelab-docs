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


6. Respect system roles across the homelab.

*Explanation:* Each of the three distinct systems (e.g., router, media server, edge compute) should retain its dedicated responsibilities. Avoid duplicating services or over‑consolidating roles unless a clear benefit exists.


7. Adopt a Test‑Driven Development (TTD) approach for new applications.

*Explanation:* Write tests first, then implement code to satisfy them. This ensures quality, eases refactoring, and produces a clear specification of expected behavior.


8. Git commit messages must follow the Google Conventional Commit style.

*Explanation:* Commits should start with a type (feat, fix, docs, style, refactor, test, chore) followed by a short subject line.


9. Use branching for all changes; branches should be named descriptively.

*Explanation:* Develop in separate feature branches (e.g., `feat/<short-identifier>`), bug fix branches (`fix/<id>`), or release branches (`release/<version>`). Merge via PR and keep the main branch stable.


10. Pull requests (PRs) are required for merging any branch into `main`.

*Explanation:* Use a PR process to review changes, run CI tests, and document the intent before integration.


11. Leverage GitHub Actions for CI and quality control wherever practicable.

*Explanation:* Define reusable workflows that run lint, tests, and security scans on push or PR events, ensuring consistent build quality.


12. Use schematic versioning and tag releases appropriately.

*Explanation:* Whenever a state change is versioned (e.g., an IaC change, config file update), create a semantic‑style tag that reflects the change magnitude. This makes rollbacks and audits straightforward.


13. Artifacts produced during CI (website builds, Docker images, etc.) must be published as GitHub releases.

*Explanation:* Publishing artifacts as release assets makes them discoverable, version‑controlled, and accessible for deployment or download.

