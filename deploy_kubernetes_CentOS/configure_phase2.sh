#!/usr/bin/env bash

yum upgrade -y
yum install -y open-vm-tools mc docker kubelet


systemctl enable docker && systemctl start docker
systemctl enable kubelet && systemctl start kubelet

cat << EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
 
sysctl --system
