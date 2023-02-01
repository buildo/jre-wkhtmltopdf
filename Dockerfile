FROM eclipse-temurin:8u362-b09-jre-jammy@sha256:3b83f3fc0d016d7536dfd5e8a98ece451061b7dbb6d5db3ddea2db30b6153b28

# Download and install wkhtmltopdf
RUN apt-get update \
    && apt-get install -y \
    curl \
    xfonts-base \
    xfonts-75dpi \
    fontconfig \
    libxext6 \
    libx11-6 \
    libxrender1 \
    libjpeg-turbo8 \
    && apt-get clean

RUN curl "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb" -L -o "wkhtmltopdf.deb" \
    && dpkg -i ./wkhtmltopdf.deb \
    && apt-get install -f \
    && rm -rf wkhtmlto*