#!/bin/bash

#installing SSM agent on ubuntu server...
SERVICE='amazon-ssm-agent';

if ps ax | grep -v grep | grep $SERVICE > /dev/null
then
    echo "$SERVICE service running..."
else
    echo "$SERVICE is not running\n"
    echo "starting the ssm-agent\n"
    sudo systemctl start $SERVICE
    if ps ax | grep -v grep | grep $SERVICE > /dev/null
        then
                echo "$SERVICE is now running\n"
    fi
fi

