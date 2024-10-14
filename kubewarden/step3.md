# Policy 1

## Build and deploy policy
```
opa build -t wasm -e policy/main common/request.rego policy1/deny-privileged-policy.rego
tar -xvzf bundle.tar.gz /policy1.wasm
kwctl annotate policy1.wasm --metadata-path policy1/metadata1.yaml --output-path annotated-policy1.wasm
kwctl push annotated-policy1.wasm localhost:5000/policy1:latest
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
