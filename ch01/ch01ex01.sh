#!/bin/bash

# Install httpd package
yum install -y httpd 

# Update web server default http port
sed -i 's/^Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf

# Start and enable services
systemctl start httpd && systemctl enable httpd

