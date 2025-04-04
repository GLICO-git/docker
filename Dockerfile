FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/bin/zsh

# package install
RUN apt update && apt install -y \
    python3 python3-pip \
    build-essential cmake gcc g++ make clang clang-format \
    git curl wget unzip zsh bat gettext \
    libtool libtool-bin autoconf automake pkg-config \
    ca-certificates software-properties-common lsb-release \
    locales tzdata

# TimeZone & locale
RUN ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime \
 && dpkg-reconfigure -f noninteractive tzdata \
 && locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8

# Node.js 
RUN curl -fsSL https://deb.nodesource.com/setup_21.x | bash - \
 && apt-get install -y nodejs

# bat -> batcat
RUN mkdir -p /root/.local/bin \
 && ln -s /usr/bin/batcat /root/.local/bin/bat

# Neovim v0.9.2
RUN git clone https://github.com/neovim/neovim.git /opt/neovim \
 && cd /opt/neovim \
 && git checkout v0.9.2 \
 && make CMAKE_BUILD_TYPE=RelWithDebInfo \
 && make install

# nvim setup
RUN mkdir -p /root/.config \
 && git clone https://github.com/GLICO-git/nvim /root/.config/nvim

ENV PATH="/root/.local/bin:$PATH"

WORKDIR /root

CMD ["zsh"]
