
### Create minikube cluster with one node
`minikube start --driver=docker --extra-config=kubeadm.ignore-preflight-errors=NumCPU --force --cpus=1 --memory=1983mb --insecure-registry="10.0.0.0/24"`{{exec}}

### Deploy kubewarden controller
```
helm install --wait -n kubewarden --create-namespace kubewarden-crds kubewarden/kubewarden-crds
helm install --wait -n kubewarden kubewarden-controller kubewarden/kubewarden-controller
```{{exec}}

### Enable local registry
Enable local registry to push and pull policy wasm file.
`minikube addons enable registry`{{exec}}

Use port forward to access registry from host machine.
```
kubectl port-forward --namespace kube-system svc/registry 5000:80 &
mkdir ~/.config/kubewarden
echo 'insecure_sources: ["localhost:5000"]' > ~/.config/kubewarden/sources.yaml
```{{exec}}