# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

# Install test dialog package
RUN rpm-ostree install \
    vim \
    git \
    htop
