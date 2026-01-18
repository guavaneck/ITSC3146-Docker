FROM debian:bookworm-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV XDG_RUNTIME_DIR=/tmp
ENV HOME=/home
ENV PATH="/opt/nvim/bin:$PATH"

WORKDIR /home

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        tar \
        xz-utils \
        nano \
        git \
        wget \
        ca-certificates \
        vim \
        build-essential \
        tcl \
        tcllib \
        jq \ 
        tk \
        imagemagick \ 
        xterm \
        wireshark \
        socat \
        make && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && \
    apt-get install -y ca-certificates curl && \
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
    tar -xzf nvim-linux-x86_64.tar.gz && \
    mv nvim-linux-x86_64 /opt/nvim && \
    rm nvim-linux-x86_64.tar.gz


RUN mkdir -p /home/.config && \
    git clone https://github.com/LazyVim/starter /home/.config/nvim || true

WORKDIR /tmp
RUN git clone https://github.com/jeffreyalanwang/imunes.git && \
    cd imunes && \
    make install && \
    imunes -p
    
WORKDIR /home
RUN rm -rf /tmp/imunes/

WORKDIR /home
RUN mkdir -p /home/.imunes && chmod -R 777 /home

RUN mkdir ~/imunes && \
    git clone https://${GITHUB_USER}:${GITHUB_TOKEN}@github.com/imunes/imunes-examples

RUN cd ~/imunes-examples && \
    git checkout 8715a48a6

CMD ["/bin/bash"]

