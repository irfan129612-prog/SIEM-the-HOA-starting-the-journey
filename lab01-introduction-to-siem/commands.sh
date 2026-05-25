# Lab 01: Introduction to SIEM - Commands

sudo apt update
sudo apt install -y git

git clone https://github.com/wazuh/wazuh-docker.git -b v4.14.5
cd wazuh-docker/single-node

sudo docker compose -f generate-indexer-certs.yml run --rm generator
sudo docker compose up -d

sudo docker ps

sudo docker exec -it single-node-wazuh.manager-1 bash

tail -f /var/ossec/logs/ossec.log

cat > /var/ossec/etc/rules/local_rules.xml << 'EOF'
<group name="custom,json,">
  <rule id="100100" level="10">
    <decoded_as>json</decoded_as>
    <field name="event_action">login</field>
    <field name="login_status">failure</field>
    <description>Failed login attempt detected</description>
  </rule>
</group>
EOF

/var/ossec/bin/wazuh-control restart

echo '{"event_action":"login","login_status":"failure","user":"attacker"}' >> /var/ossec/logs/test.json

tail -n 50 /var/ossec/logs/alerts/alerts.log
