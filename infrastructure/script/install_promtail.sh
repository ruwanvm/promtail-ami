#!/bin/bash
PROMTAL_LOCATION=$1
sudo mkdir -p /opt/promtail
sudo aws s3 cp s3://${PROMTAL_LOCATION}/PLG-stack/promtail/promtail-linux-amd64 /opt/promtail/
sudo chmod +x /opt/promtail/promtail-linux-amd64
sudo aws s3 cp s3://${PROMTAL_LOCATION}/PLG-stack/promtail/promtail.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable promtail.service