## 4.3 System: Severn

**Hardware**: Single‑board computer (Raspberry Pi 2 B+) serving as the network‑attached storage controller.

**Purpose**: Provide reliable SMB/NFS shares for the homelab media servers and host‑based backup utilities.

**Key directories**:
- `/mnt/nas/` – mount point for external 4‑TB SATA SSD.
- `/srv/media/` – top‑level collection of media libraries.
  - `/srv/media/TV/` – archival TV shows.
  - `/srv/media/Movies/` – movie collection.
  - `/srv/media/Personal/` – personal media, backups.

**Network configuration**:
- Static IP: **10.0.0.4**.
- Shares the same shell environment and DNS configuration as the other Raspberry Pi devices.

**Deployment**:
- Ansible role `severn/nas` manages NFS/SMB setup, HDD formatting, and automatic mount options.
- Monitoring via Prometheus node_exporter, with alerts for mounts and performance.

**Compliance with rules**:
- **Rule 5** – Configuration delivered via Ansible.
- **Rule 12** – Tag releases after any configuration change.
- **Rule 17** – Disk usage and I/O statistics are monitored; alerts triggered when usage > 80 % or I/O latency exceeds threshold.
- **Rule 3** – A `docs/severn/` subfolder in the repository contains detailed NAS documentation.

---

