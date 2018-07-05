 #!/bin/bash

 ## ADD NEW USER TO SUDO AND WWW-DATA SET PUBLIC KEY
 ## TAKES PUBLIC KEY and USERNAME

 USERNAME=$1
 KEY=$2

 sudo su
 mkdir -p /home/$USERNAME/.ssh
 touch /home/$USERNAME/.ssh/authorized_keys
 useradd -d /home/$USERNAME $USERNAME
 usermod -aG sudo $USERNAME
 usermod -aG www-data $USERNAME
 chown -R $USERNAME:$USERNAME /home/$USERNAME
 chown root:root /home/$USERNAME
 chmod 700 /home/$USERNAME/.ssh
 chmod 644 /home/$USERNAME/.ssh/authorized_keys
 passwd $USERNAME | Circle120#!
 sed "1 a  ${KEY}" /home/$USERNAME/.ssh/authourized_keys
 
