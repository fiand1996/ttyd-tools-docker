# ttyd-tools-docker

A lightweight, feature-rich web-based terminal Docker image powered by [ttyd](https://github.com/tsl0922/ttyd). Pre-configured with essential networking tools, DevOps utilities, and a custom Zsh environment.

> **Architecture Support:** Built with multi-arch support for **`linux/amd64`** (Intel/AMD) and **`linux/arm64`** (Apple Silicon, Raspberry Pi, Cloud ARM VPS).

---

## 🛠️ Included Tools & Environment

- **Shell & Terminal:** Zsh, Oh My Zsh, Tmux, Nano, Git
- **Sysadmin & System Info:** `fastfetch`
- **Cloud & DevOps:** `kubectl`
- **Networking Tools:** `ping`, `traceroute`, `netstat`/`ifconfig` (`net-tools`), `netcat` (`nc`), `ssh`, `curl`, `wget`
- **Directory Setup:** Pre-created directories with strict permissions for `~/.kube` and `~/.ssh`.

---

## 🚀 Getting Started

### 1. Pull Image from GitHub Container Registry (GHCR)

You can pull the pre-built multi-arch image directly:

```bash
docker pull ghcr.io/fiand1996/ttyd-tools-docker:latest

```

### 2. Run the Container

Start the web terminal listening on port `7681`:

```bash
docker run -d \
  -p 7681:7681 \
  --name web-terminal \
  --restart unless-stopped \
  ghcr.io/fiand1996/ttyd-tools-docker:latest -W /bin/zsh

```

Open your browser and navigate to `http://localhost:7681`.

### 3. Persistent Volumes (Optional)

To mount your SSH keys and Kubernetes context into the container:

```bash
docker run -d \
  -p 7681:7681 \
  -v ~/.ssh:/root/.ssh:ro \
  -v ~/.kube:/root/.kube:ro \
  --name web-terminal \
  --restart unless-stopped \
  ghcr.io/fiand1996/ttyd-tools-docker:latest -W /bin/zsh

```

---

## 🛠️ Building Locally

If you prefer to build the Docker image locally on your machine:

```bash
docker build -t ttyd-tools-docker .

```

---

## 📜 Credits & Acknowledgments

This personal setup relies on the following open-source projects:

- **[ttyd](https://github.com/tsl0922/ttyd)** by Shuanglei Tao – C tool for sharing terminal over the web.
- **[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh)** – Community-driven framework for managing Zsh configuration.
- **[fastfetch](https://github.com/fastfetch-cli/fastfetch)** – Neofetch-like tool written mainly in C.
- **[kubectl](https://kubernetes.io/docs/tasks/tools/)** – Kubernetes command-line tool.

---

## 📄 License

[MIT](https://www.google.com/search?q=LICENSE)
