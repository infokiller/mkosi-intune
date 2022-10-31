ARG BUILD_IMG=debian:sid
FROM ${BUILD_IMG} AS build-stage
# hadolint ignore=DL3009,DL3008
RUN DEBIAN_FRONTEND=noninteractive apt-get \
    -o DPkg::options::="--force-confdef" \
    -o DPkg::options::="--force-confold" \
    update -y && \
  DEBIAN_FRONTEND=noninteractive apt-get \
      -o DPkg::options::="--force-confdef" \
      -o DPkg::options::="--force-confold" \
      install --no-install-recommends -y \
      make sudo debootstrap binutils ubuntu-keyring ubuntu-archive-keyring mkosi pulseaudio systemd-container xorg zstd

COPY . /src
WORKDIR /src
# RUN mkosi build

# FROM scratch AS export-stage
# COPY --from=build-stage /usr/share/OVMF/OVMF_CODE.ms.fd /
# COPY --from=build-stage /usr/share/OVMF/OVMF_VARS.ms.fd /
