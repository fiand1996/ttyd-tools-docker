FROM tsl0922/ttyd:latest

# Docker Buildx automatically sets TARGETARCH (e.g. amd64 or arm64)
ARG TARGETARCH

RUN apt-get update && apt-get install -y --no-install-recommends \
    zsh \
    curl \
    wget \
    nano \
    tmux \
    iputils-ping \
    traceroute \
    net-tools \
    netcat-openbsd \
    openssh-client \
    git \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Map TARGETARCH to fastfetch naming (amd64 -> amd64, arm64 -> aarch64)
RUN FASTFETCH_ARCH=$([ "$TARGETARCH" = "arm64" ] && echo "aarch64" || echo "amd64") \
    && FASTFETCH_VERSION=$(curl -s "https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest" | grep -oP '"tag_name": "\K[^"]*') \
    && wget "https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-${FASTFETCH_ARCH}.deb" \
    && dpkg -i "fastfetch-linux-${FASTFETCH_ARCH}.deb" \
    && rm "fastfetch-linux-${FASTFETCH_ARCH}.deb"

# Download kubectl based on TARGETARCH (amd64 or arm64)
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/${TARGETARCH}/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN mkdir -p /root/.kube /root/.ssh && chmod 700 /root/.ssh

ENV SHELL=/bin/zsh

ENTRYPOINT ["ttyd"]