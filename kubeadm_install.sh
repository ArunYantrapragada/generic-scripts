#!/bin/bash -x

# Get the gpg keys for Kubeadm
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Set SELinux in permissive mode (effectively disabling it)
sudo setenforce 0
sudo sed -i 's/^SELINUX=enforcing$/SELINUX=permissive/' /etc/selinux/config

#sudo yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
yum install -y kubelet-1.16.7 kubeadm-1.16.7 kubectl-1.16.7 --disableexcludes=kubernetes
sudo systemctl enable --now kubelet

sudo kubeadm init



