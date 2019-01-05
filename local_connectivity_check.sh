#!/bin/bash
IP=$(hostname -I)
# Block Google Connectivity check:
mkdir /var/www/html/generate_204/
echo "<?php header(\"HTTP/1.0 204 No Content\"); ?>">/var/www/html/generate_204/index.php
echo "$IP    connectivitycheck.gstatic.com">>/etc/hosts
echo "$IP    connectivitycheck.android.com">>/etc/hosts

# Block Firefox Connectivity check:
echo "success">/var/www/html/success.txt
echo "$IP    detectportal.firefox.com">>/etc/hosts

pihole restartdns
