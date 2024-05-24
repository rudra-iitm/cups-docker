#! /bin/bash
set -e

echo "Building CUPS"

apt-get update

# Install build dependencies
echo "Installing build dependencies"
apt-get install -y autoconf build-essential libavahi-client-dev \
    libgnutls28-dev libkrb5-dev libnss-mdns libpam-dev \
    libsystemd-dev libusb-1.0-0-dev zlib1g-dev curl

# Build and install cups
echo "Downloading CUPS source"
curl -o cups-source.tar.gz -L \
    https://github.com/OpenPrinting/cups/releases/download/v2.4.8/cups-2.4.8-source.tar.gz

tar --strip=1 -xf cups-source.tar.gz

echo "Configuring CUPS"
./configure
make
make install
