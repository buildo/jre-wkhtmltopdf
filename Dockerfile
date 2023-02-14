FROM eclipse-temurin:17.0.6_10-jre-focal@sha256:b10df4660e02cf944260b13182e4815fc3e577ba510de7f4abccc797e93d9106

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
    libssl1.1 \
    && apt-get clean

RUN curl "https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox_0.12.6-1.focal_amd64.deb" -L -o "wkhtmltopdf.deb" \
    && dpkg -i ./wkhtmltopdf.deb \
    && apt-get install -f \
    && rm -rf wkhtmlto*