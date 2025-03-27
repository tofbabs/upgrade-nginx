# 🐳 Nginx Upgrade Validator (1.18 → 1.25) on Ubuntu 20.04

This project provides a Docker-based environment to **validate the upgrade flow of Nginx** from version **1.18 (default in Ubuntu 20.04)** to **1.25 (mainline)** from this article - https://medium.com/@hynk/upgrading-nginx-from-version-1-18-to-1-25-ubuntu-20-04-b7873069402a 

It's useful for testing the configuration compatibility, backup strategy, and deployment process before applying the upgrade in a production environment.

---

## 🚀 What It Does

- Installs Nginx 1.18 (default version from Ubuntu 20.04 repos)
- Backs up the default Nginx configuration
- Adds the official Nginx mainline repository securely
- Upgrades to Nginx 1.25
- Verifies the version
- Runs Nginx in the foreground

---

## 📂 Files

| File         | Description                                               |
|--------------|-----------------------------------------------------------|
| `Dockerfile` | Instructions to build the container and run the upgrade  |
| `README.md`  | You're here 🙂                                             |

---

## 🛠️ How to Use

### 1. Clone this repo

```bash
git clone https://github.com/your-org/nginx-upgrade-validator.git
cd nginx-upgrade-validator
```

### 🎯 Upgrade Strategies

| Upgrade Mode     | Command                                          | Use Case                                      |
|------------------|--------------------------------------------------|-----------------------------------------------|
| Specific 1.25.x  | `apt-get install -y nginx=1.25.*`                | Controlled upgrade to 1.25 line only          |
| Latest Mainline  | `apt-get install -y nginx`                       | Always get latest (e.g. 1.26, 1.27...)         |
| Exact Version     | `apt-get install -y nginx=1.25.3-1~focal`        | Locked upgrade for deterministic builds       |

