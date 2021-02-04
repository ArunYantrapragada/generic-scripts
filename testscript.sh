#!/bin/bash

echo "simple test script to check if jenkins is working as intended"
rpm -qa | grep 'jenkins'
echo "------"
rpm -qa | grep 'ssh'
echo "adding one more command"
ls -la /datadrive/

exit 0
