# Troubleshooting

## Issue 1: Invalid Wazuh Docker Image

### Error

```text
pull access denied for wazuh/wazuh
Cause

The image wazuh/wazuh does not exist.

Fix

Used official Wazuh Docker Compose setup.

git clone https://github.com/wazuh/wazuh-docker.git -b v4.14.5
cd wazuh-docker/single-node
sudo docker compose up -d
Issue 2: No Such Container
Error
No such container: wazuh
Cause

Docker Compose creates containers with different names.

Fix

Used the correct container name:

sudo docker exec -it single-node-wazuh.manager-1 bash
Issue 3: apt Command Not Found
Error
apt: command not found
Cause

The Wazuh container is minimal and does not include apt.

Fix

Edited configuration files from the host machine instead of inside the container.

Issue 4: Static Field Error
Error
Field 'action' is static.
Cause

action is a reserved/static field in Wazuh.

Fix

Changed JSON field names:

{"event_action":"login","login_status":"failure"}
Issue 5: Disk Space Full
Error
Partition usage reached 100%
Fix
sudo docker system prune -a -f
sudo journalctl --vacuum-size=100M
