#!/bin/ksh

#Script to run commands in loop for multiple servers by reading ip's from file as input. 
 INFILE=$1
 
 if [[ ! -s $INFILE ]]
 then
   echo "ERROR : INFILE ($INFILE) does NOT exist"
   exit 99
 else
   echo "INFILE ($INFILE) does exist"
 fi
 
 for ipaddr in `cat $INFILE`
 do
 echo "running for $ipaddr"
 
 #Key pair to run against ec2-instances
 ssh -i <ssh-key> user@$ipaddr  << EOF
 ls -a
 sudo -i
 
 #command/script to run at this section...
 ls -al 
 ##
 
 EOF
 done
