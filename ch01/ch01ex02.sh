#!/bin/bash

HTTPD_PKG=httpd
HTTPD_SVC=httpd
HTTPD_CFG=/etc/httpd/conf/httpd.conf

# Install httpd package if not present
if ! rpm -q $HTTPD_PKG &> /dev/null
then
  yum install -y $HTTPD_PKG
fi 

# Update web server default http port
if [ -f $HTTPD_CFG ]
then
  sed -i 's/^Listen 80/Listen 8080/' $HTTPD_CFG
fi

# Start service if not started
if ! systemctl is-started httpd &> /dev/null
then
  systemctl start httpd
fi

# Enable service if not enabled
if ! systemctl is-enabled httpd &> /dev/null
then
  systemctl enable httpd
fi

