FROM eclipse-temurin:17.0.12_7-jre-focal@sha256:e76ab78a6ac94695fe4f3a431be34499cb3e12dcf544947f49a4a292e6508af6

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
