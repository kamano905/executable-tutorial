# Setup-1

## Install minikube

```
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
echo 'alias kubectl="minikube kubectl --"' >> .bashrc && source ~/.bashrc
```{{exec}}

## Install helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```{{exec}}

## Setup Kubewarden
### Install Kubewarden
```
helm repo add kubewarden https://charts.kubewarden.io
helm repo update kubewarden`
```{{exec}}
### Install helm chart
```
helm install --wait -n kubewarden --create-namespace kubewarden-crds kubewarden/kubewarden-crds
helm install --wait -n kubewarden kubewarden-controller kubewarden/kubewarden-controller
```{{exec}}


### Install kwctl
```
wget https://github.com/kubewarden/kwctl/releases/download/v1.17.0/kwctl-linux-x86_64.zip
unzip kwctl-linux-x86_64.zip
chmod 700 kwctl-linux-x86_64
sudo mv ./kwctl-linux-x86_64 /opt/
echo 'alias kwctl=/opt/kwctl-linux-x86_64' >> ~/.bashrc && source ~/.bashrc
```{{exec}}
