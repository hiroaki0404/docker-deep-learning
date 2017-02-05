#!/bin/bash
echo 'pgrep uim-fep || uim-fep' >> /etc/skel/.bashrc
CONUSER=${CUSER:-"docker"}
CONPASSWD=${CPASSWD:-"docker"}
/usr/sbin/useradd -m $CONUSER -G sudo -s /bin/bash
echo $CONUSER:"$CONPASSWD" | /usr/sbin/chpasswd
mkdir /var/run/sshd
/usr/sbin/sshd -D
