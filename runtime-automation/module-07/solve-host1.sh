#!/bin/sh

# 7.4 How to Protect Yourself

# 7.4.1 Example output adding the blocking for these devices:

sudo tee /etc/usbguard/rules.conf > /dev/null <<'EOF'
allow id 046d:c52b serial "1234ABCD" name "Logitech USB Receiver"
allow id 046d:c31c
reject id 0483:5740
reject id 1eaf:0030
reject id d3c0:d34d
allow with-interface 09:00:00
allow with-interface 03:00:*
block with-interface 08:*:*
block
EOF

# 7.4.2 Before applying, validate syntax:

sudo usbguard read-descriptor /etc/usbguard/rules.conf

# 7.4.3 Apply the new policy:

sudo systemctl restart usbguard.service

# 7.4.4 Review the file:

sudo cat /etc/usbguard/rules.conf

# 7.4.5 Check which devices are currently allowed:

sudo usbguard list-devices

echo "Solved module called module-07" >> /tmp/progress.log
