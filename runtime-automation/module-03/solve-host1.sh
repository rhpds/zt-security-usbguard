#!/bin/sh

# 3.1 Generate Initial Policy

sudo usbguard generate-policy > /tmp/initial-rules.conf

cat /tmp/initial-rules.conf

# 3.2 Install the Initial Policy

sudo install -m 0600 -o root -g root /tmp/initial-rules.conf /etc/usbguard/rules.conf

ls -l /etc/usbguard/rules.conf

# 3.3 Start USBGuard Service

sudo systemctl enable usbguard.service

sudo systemctl start usbguard.service

# 3.4 Verify Service Status

sudo systemctl status usbguard.service 

# 3.5 Test Basic Functionality

sudo usbguard list-devices

echo "Solved module called module-03" >> /tmp/progress.log
