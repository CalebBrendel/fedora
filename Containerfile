# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

COPY my_packages.txt /tmp/packages.txt

RUN rpm-ostree install \
    --allow-inactive \
    $(grep -vE '^(kernel|systemd|glibc|filesystem|setup|basesystem)' /tmp/packages.txt | xargs) && \
    rpm-ostree cleanup -af

RUN rm /tmp/packages.txt
