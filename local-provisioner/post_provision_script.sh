#!/bin/bash

# Capture the public IP from the argument
INSTANCE_IP=$1

# Simulate a post-provisioning task
echo "Executing post-provision script for instance at IP: $INSTANCE_IP"
echo "Performing additional setup for $INSTANCE_IP..." >> post_provision_log.txt
echo "Setup completed for $INSTANCE_IP at $(date)" >> post_provision_log.txt
