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


14. Store secrets and credentials in a central, encrypted vault (HashiCorp Vault, AWS SSM Parameter Store, etc.) and inject them via Ansible or container secrets.

*Explanation:* Prevents accidental leakage of keys, passwords, or TLS certificates in codebases or public repositories.

15. All changes (CI builds, deployments, configuration updates) must generate traceable logs in a central monitoring system (Elasticsearch/Prometheus/Grafana) and be retained for 90 days when required.

*Explanation:* Provides forensic visibility and supports internal or regulatory audits.

16. Lock dependencies for all languages and tools (e.g., Pip‑freeze, Bundler Gemfile.lock, npm package-lock.json, Go modules) and run a scheduled vulnerability scan using tools such as OWASP Dependency-Check, GitHub Dependabot, or Trivy.

*Explanation:* Keeps the software stack predictable and alerts about exploitable libraries before deployment.

17. Document and monitor CPU, RAM, and storage limits for each host and container; trigger alerts when thresholds are exceeded.

*Explanation:* Prevents resource exhaustion and facilitates capacity planning.

18. Every pull request must run unit, integration, and smoke tests; test coverage must not fall below 80 %.

*Explanation:* Maintains code health and flags regressions early.

19. All README, CONTRIBUTING, CHANGELOG, and ROADMAP files must be updated on each release.

*Explanation:* Keeps documentation current and eases onboarding.


## 4.2 System: Torridge

**Hardware**: Legacy laptop (model TBD) configured as a persistent, always‑on server.

**Purpose**: Host Docker containers that perform audio/video processing workloads.

**Key directories**:
- `/srv/` – top‑level filesystem for all service data.
  - `/srv/work/` – workspace for file ingest and processing.
    - Sub‑folders within `/srv/work/` hold job‑specific data and intermediate results.

**Network configuration**:
- Static IP: **10.0.0.8**.
- Shares the same shell environment as Severn and other Raspberry Pi devices.

**Deployment**:
- Ansible role `torridge/docker` manages Docker install, container orchestration (docker‑compose or Docker‑Swarm), and CI‑driven image builds.
- Volumes for `/srv/` are mounted in containers to preserve data across restarts.

**Compliance with rules**:
- **Rule 5** – Configuration delivered via Ansible.
- **Rule 14** – Any secrets for container registries or media services are pulled from Vault.
- **Rule 18** – Container image tests and functional smoke tests are part of the CI pipeline.
- **Rule 12** – Tag releases after significant configuration changes.
- **Rule 17** – Monitor memory and disk usage on the laptop; alert if thresholds are exceeded.
- **Rule 3** – A `docs/torridge/` subfolder within the repository documents the host’s role and usage.

