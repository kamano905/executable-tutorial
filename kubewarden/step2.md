# Setup Cluster

## Create cluster with one node
`minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1 --memory=1983mb --insecure-registry="10.0.0.0/24"`{{exec}}

## Create kubewarden controller
```
helm install --wait -n kubewarden --create-namespace kubewarden-crds kubewarden/kubewarden-crds
helm install --wait -n kubewarden kubewarden-controller kubewarden/kubewarden-controller
```{{exec}}

## Deploy local registory
```
minikube addons enable registry
kubectl port-forward --namespace kube-system svc/registry 5000:80 &
mkdir ~/.config/kubewarden
echo 'insecure_sources: ["localhost:5000"]' > ~/.config/kubewarden/sources.yaml
```{{exec}}