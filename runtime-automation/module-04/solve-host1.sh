#!/bin/sh

# 4.1 View Current Rules

sudo cat /etc/usbguard/rules.conf

# 4.3 List Devices with Details

sudo usbguard list-devices

# 4.5 Understanding Interface Types

sudo usbguard list-devices | grep -A 5 "with-interface"

# 4.7 Practice: Create a Simple Rule

echo 'allow with-interface 03:00:01' | sudo tee -a /etc/usbguard/rules.conf

# 4.8 Validate Rules Syntax

sudo usbguard read-descriptor /etc/usbguard/rules.conf


echo "Solved module called module-03" >> /tmp/progress.log
