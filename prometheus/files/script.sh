#!/bin/bash
# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# download the tar ball of prometheus software
wget https://github.com/prometheus/prometheus/releases/download/v2.11.1/prometheus-2.11.1.linux-amd64.tar.gz

# untar the software
tar xvzf prometheus-2.11.1.linux-amd64.tar.gz

# move the software to /opt directory
sudo mv prometheus-2.11.1.linux-amd64 /opt/prometheus

# remove the tar ball from the location
rm prometheus-2.11.1.linux-amd64.tar.gz 

# moving the systemd file to its exact location
sudo mv /tmp/prometheus.service /etc/systemd/system/prometheus.service

# move prometheus configuration file to its exact location
sudo mv /tmp/prometheus.yml /opt/prometheus/prometheus.yml

# reload the systemctl configuration
sudo systemctl daemon-reload

# start the prometheus services with systemctl
sudo systemctl start prometheus
