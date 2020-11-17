FROM archlinux

ENV PIP_NO_CACHE_DIR 1

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN pacman -Syu --noconfirm \
    git \
    python-lxml \
    curl \
    pv \
    jq \
    ffmpeg \
    python \
    p7zip \
    python-pip \
    openssl \
    wget \
    gcc \
    neofetch \
    && rm -rf /var/cache/pacman/pkg /tmp
    
COPY requirements.txt .
RUN python3 -m pip install -r requirements.txt
COPY . .
COPY netrc /root/.netrc
RUN chmod +x aria.sh
RUN rm README.md
CMD ["bash","start.sh"]
