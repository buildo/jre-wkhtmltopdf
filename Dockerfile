FROM eclipse-temurin:17.0.18_8-jre-jammy@sha256:3a8d0a46659efc3f9ea4023f9d1e3bbcbf7ee1b5e994cbae547afe0ef8db54cf

# Download and install wkhtmltopdf
RUN apt-get update \
    && apt-get install -y \
    curl \
    ca-certificates \
    fontconfig \
    libc6 \
    libfreetype6 \
    libjpeg-turbo8 \
    libpng16-16 \
    libssl3 \
    libstdc++6 \
    libx11-6 \
    libxcb1 \
    libxext6 \
    libxrender1 \
    xfonts-75dpi \
    xfonts-base \
    zlib1g \
    && apt-get clean

RUN curl "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-3/wkhtmltox_0.12.6.1-3.jammy_amd64.deb" -L -o "wkhtmltopdf.deb" \
    && dpkg -i ./wkhtmltopdf.deb \
    && apt-get install -f \
    && rm -rf wkhtmlto*
