# ttyd-tools-docker

A lightweight, feature-rich web-based terminal Docker image powered by [ttyd](https://github.com/tsl0922/ttyd). Pre-configured with essential networking, DevOps utilities, and a custom Zsh environment.

> **Note:** This Dockerfile is currently set up for **ARM64 / aarch64** architecture (e.g., Apple Silicon, Raspberry Pi 4/5, or ARM-based Cloud VPS).

---

## 🛠️ Included Tools & Environment

- **Shell & Terminal:** Zsh, Oh My Zsh, Tmux, Nano, Git
- **Sysadmin & System Info:** `fastfetch`
- **Cloud & DevOps:** `kubectl`
- **Networking Tools:** `ping`, `traceroute`, `netstat`/`ifconfig` (`net-tools`), `netcat` (`nc`), `ssh`, `curl`, `wget`
- **Directory Setup:** Pre-created directories with strict permissions for `~/.kube` and `~/.ssh`.

---

## 🚀 Getting Started

### 1. Build the Docker Image

```bash
docker build -t custom-ttyd .
```
