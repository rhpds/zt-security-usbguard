#!/bin/sh

#5.1 Backup Current Policy

sudo cp /etc/usbguard/rules.conf /etc/usbguard/rules.conf.backup

# 5.2 Understanding the Daemon Configuration

sudo cat /etc/usbguard/usbguard-daemon.conf

# 5.3 Create a Restrictive Policy

sudo tee /etc/usbguard/rules.conf > /dev/null <<'EOF'
allow with-interface 09:00:00
allow with-interface 03:00:*
block with-interface 08:*:*
block
EOF

# 5.4 Validate the New Policy

sudo usbguard read-descriptor /etc/usbguard/rules.conf

# 5.5 Restart USBGuard Service

sudo systemctl restart usbguard.service

sudo systemctl status usbguard.service

# 5.6 Test the Policy

sudo usbguard list-devices

# 5.7 Test with a USB Device (optional)

sudo usbguard list-devices

sudo dmesg | tail -20

# 5.8 Create an Allow-List Policy

sudo tee /etc/usbguard/rules.conf > /dev/null <<'EOF'
allow id 046d:c52b serial "1234ABCD" name "Logitech USB Receiver"
allow with-interface 09:00:00
allow with-interface 03:00:*
block with-interface 08:*:*
block
EOF

# 5.9 Test the Allow-List Policy

sudo systemctl restart usbguard.service

sudo usbguard list-devices

#5.10 Policy for Specific Ports

# sudo tee /etc/usbguard/rules.conf > /dev/null <<'EOF'
# Allow controllers
allow with-interface 09:00:00

# Allow any device on front USB ports (example: ports 1-1 and 1-2)
allow via-port "1-1"
allow via-port "1-2"

# Block devices on all other ports
block via-port "1-*"
EOF


echo "Solved module called module-03" >> /tmp/progress.log
