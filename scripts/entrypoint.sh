#! /bin/bash
set -e

echo "configuring CUPS"

groupadd lpadmin

# Dependencies for openssl
apt-get install -y build-essential libssl-dev openssl

useradd -m --create-home --password $(echo 'admin' | openssl passwd -1 -stdin) -f 0 admin

usermod -aG lpadmin admin

echo 'admin ALL=(ALL:ALL) ALL' >> /etc/sudoers

echo "Starting CUPS"

/usr/sbin/cupsd \
        && while [ ! -f /var/run/cups/cupsd.pid ]; do sleep 1; done \
        && cupsctl --remote-admin --remote-any --share-printers \
        && kill $(cat /var/run/cups/cupsd.pid) \
        && echo "ServerAlias *" >> /etc/cups/cupsd.conf \
        && service cups start \
        && /usr/sbin/cupsd -f
