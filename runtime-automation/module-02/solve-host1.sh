#!/bin/sh

# 2.1 Check System Information

cat /etc/redhat-release

uname -r

# 2.2 Install USBGuard

sudo dnf install -y usbguard usbguard-tools

# 2.3 Verify Installation

rpm -qa | grep usbguard

usbguard --version

echo "Solved module called module-02" >> /tmp/progress.log
