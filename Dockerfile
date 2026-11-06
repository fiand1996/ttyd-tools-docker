FROM tsl0922/ttyd:latest

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

RUN FASTFETCH_VERSION=$(curl -s "https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest" | grep -oP '"tag_name": "\K[^"]*') \
    && wget "https://github.com/fastfetch-cli/fastfetch/releases/download/${FASTFETCH_VERSION}/fastfetch-linux-aarch64.deb" \
    && dpkg -i fastfetch-linux-aarch64.deb \
    && rm fastfetch-linux-aarch64.deb

RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl" \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN mkdir -p /root/.kube /root/.ssh && chmod 700 /root/.ssh

ENV SHELL=/bin/zsh

ENTRYPOINT ["ttyd"]