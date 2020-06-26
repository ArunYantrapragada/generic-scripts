SSH Commands:
-------------
#sshing from A-B-C in single command using privat-key and pwd
ssh -t user@ip-of-B ssh -i <path-to-privatekey> user@Ip-of-C
ssh -t user@ip-of-B ssh user@Ip-of-C

#Ssh Session timeout settings:
    # Prevent ssh timeout on client side
    ~/.ssh/config (if no config file, create it)
    Host *
        ServerAliveInterval 120

    # Prevent ssh timeout on server side:
    /etc/ssh/sshd_config
        ClientAliveInterval 120
        ClientAliveCountMax 720

SCP Commands:
-------------
#scp files from A-B-C, using B as tunnel using private key.
scp -i <path-to-privatekey> -oProxyCommand="ssh -W %h:%p user@ip-of-B" <path-to-files> user@ip-of-C:destination-path
#scp files from A-B-C, using B as tunnel using password.
scp -oProxyCommand="ssh -W %h:%p user@ip-of-B" <path-to-files> user@ip-of-C:destination-path

Rsync data from A-to-C using B as tunnel:
----------------------------------------
#Advantage of using rsync is, if some files are already in place it will only copy the delta.
rsync -azv -e 'ssh -A -J user@ip' <Path-to-files> user@ip:/home/

#Check internet connectivity
curl -Is https://www.google.com
