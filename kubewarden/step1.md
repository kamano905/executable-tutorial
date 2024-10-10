
# Install minikube

- `curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64`{{exec}}
- `sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64`{{exec}}

# Create cluster with one node
`minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1 --memory=1983mb`{{exec}}



# Setup kubectl
`echo 'alias kubectl="minikube kubectl --' >> .bashrc && source ~/.bashrc`{{exec}}
`kubectl get po -A`{{exec}}