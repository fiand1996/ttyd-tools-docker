# ttyd-tools-docker

# Custom ttyd Web Terminal

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

### 2. Run the Container

Start the web terminal listening on port `7681`:

```bash
docker run -d \
  -p 7681:7681 \
  --name web-terminal \
  --restart unless-stopped \
  custom-ttyd -port 7681 zsh

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
  custom-ttyd -port 7681 zsh

```

---

## 🏗️ Architecture Support

If you need to run this on an **x86_64 / amd64** machine, update the following lines in the `Dockerfile`:

- Change `fastfetch-linux-aarch64.deb` to `fastfetch-linux-amd64.deb`
- Change `bin/linux/arm64/kubectl` to `bin/linux/amd64/kubectl`

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
