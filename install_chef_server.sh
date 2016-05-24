#!/bin/bash

wget https://packages.chef.io/stable/el/5/chef-server-core-12.6.0-1.el5.x86_64.rpm
rpm -Uvh chef-server-core-12.6.0-1.el5.x86_64.rpm
sudo chef-server-ctl reconfigure
sudo chef-server-ctl install chef-manage
sudo chef-server-ctl reconfigure
