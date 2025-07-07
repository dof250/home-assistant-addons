ARG BUILD_FROM
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Install requirements
RUN \
    apk add --no-cache \
        nginx \
        ffmpeg \
        curl \
        bash \
    && rm -rf /var/cache/apk/*

# Copy rootfs
COPY rootfs /

# Labels voor Home Assistant
LABEL \
    io.hass.name="RTSP2MJPG" \
    io.hass.description="Convert RTSP streams to MJPEG" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION}
