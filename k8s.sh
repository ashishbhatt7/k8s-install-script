#!/bin/bash

RED="\033[0;31m"
GREEN="\033[0;32m"
NC="\033[0m"

read  -p "Choose one to Install
		1 Master
		2 Worker 
		Option 1 or 2: " name 

	if [ "$name" =  "1" ] ; then
 		apt-get install -y net-tools&&sudo apt-get update; sudo apt-get install -y apt-transport-https ca-certificates curl gpg ; curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg ; echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list ; sudo apt-get update ; sudo apt-get install -y kubelet kubeadm kubectl ; sudo apt-mark hold kubelet kubeadm kubectl ; sudo systemctl enable --now kubelet ; sudo apt install -y containerd ; mkdir /etc/containerd; containerd config default > /etc/containerd/config.toml;sed -i '/^\s*SystemdCgroup/s/\<false\>/true/' /etc/containerd/config.toml;mkdir -p $HOME/.kube ; sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config ; sudo chown $(id -u):$(id -g) $HOME/.kube/config ; echo 1 > /proc/sys/net/ipv4/ip_forward; kubeadm init --pod-network-cidr=10.244.0.0/16

		echo -e "${GREEN} Master is Ready..${NC}"

	elif [ "$name" -eq "2" ] ; then
		sudo apt-get update; sudo apt-get install -y apt-transport-https ca-certificates curl gpg ; curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg ; echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list ; sudo apt-get update ; sudo apt-get install -y kubelet kubeadm kubectl ; sudo apt-mark hold kubelet kubeadm kubectl ; sudo systemctl enable --now kubelet ; sudo apt install -y containerd ; mkdir /etc/containerd; containerd config default > /etc/containerd/config.toml; sed -i '/^\s*SystemdCgroup/s/\<false\>/true/' /etc/containerd/config.toml; echo 1 > /proc/sys/net/ipv4/ip_forward

		echo -e "${GREEN} Worker is Ready..${NC}"
	else
		echo -e "${RED}Invalid number${NC}"
	fi		



