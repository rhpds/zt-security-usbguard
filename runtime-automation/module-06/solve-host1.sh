#!/bin/sh

# 6.2.5 Internal USB Devices

sudo usbguard list-devices

# 6.3 Best Practices for Working Within Limitations

sudo journalctl -u usbguard -n 100 | grep -i block

sudo usbguard list-devices

sudo cp /etc/usbguard/rules.conf /etc/usbguard/rules.conf.backup

echo "Solved module called module-04" >> /tmp/progress.log
