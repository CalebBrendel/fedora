# F43 Universal Blue Image
FROM ghcr.io/ublue-os/kinoite-main:latest

COPY packages.txt /tmp/packages.txt

# 2. Tell rpm-ostree to install everything listed in that file
# This command strips newlines and passes every name as an argument
RUN rpm-ostree install $(cat /tmp/packages.txt | xargs) && \
    rpm-ostree cleanup -af

# 3. Clean up the temp file to keep the image slim
RUN rm /tmp/packages.txt
