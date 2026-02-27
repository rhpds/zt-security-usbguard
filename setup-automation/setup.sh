#!/bin/bash
USER=rhel

echo "Adding wheel" > /root/post-run.log
usermod -aG wheel rhel

echo "Setup vm control01" > /tmp/progress.log

chmod 666 /tmp/progress.log 

#dnf install -y nc

dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-10.noarch.rpm

dnf install -y certbot
