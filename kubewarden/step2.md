# Setup-2

## Install OPA
```
curl -L -o opa https://openpolicyagent.org/downloads/v0.69.0/opa_linux_amd64_static
sudo mv ./opa /opt/opa
chmod 755 ./opa
`echo 'export PATH=$PATH:/opt' >> ~/.bashrc && source ~/.bashrc
```{{exec}}

## Create cluster with one node
`minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1 --memory=1983mb --insecure-registry="10.0.0.0/24"`{{exec}}

## Deploy local registory
- `minikube addons enable registry`{{exec}}
- `kubectl port-forward --namespace kube-system svc/registry 5000:80 &`{{exec}}
- `mkdir ~/.config/kubewarden`{{exec}}
- `echo 'insecure_sources: ["localhost:5000"]' > ~/.config/kubewarden/sources.yaml`{{exec}}