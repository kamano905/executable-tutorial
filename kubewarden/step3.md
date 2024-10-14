# Policy 1

## Build and deploy policy
```
cd policy1
opa build -t wasm -e policy/main ../common/request.rego deny-privileged-policy.rego
tar -xvzf bundle.tar.gz /policy.wasm
kwctl annotate policy1.wasm --metadata-path metadata1.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/policy1:latest
cd ..
```{{exec}}

## Apply policy
- Get cluster IP address of the local registry
  - `kubectl get svc/registry -n kube-system`{{exec}}
- Open policy declaration files and edit IP address
  - `vi common/policy-server.yaml`{{exec}}
  - `vi policy1/policy1.yaml`{{exec}}
- Apply policies
  - `kubectl apply -f common/policy-server.yaml`{{exec}}
  - `kubectl apply -f policy1/policy1.yaml`{{exec}}

## Try to create privileged pod
- `kubectl apply -f policy1/no-privileged-pod.yaml`{{exec}}
- `kubectl apply -f policy1/privileged-pod.yaml`{{exec}}
