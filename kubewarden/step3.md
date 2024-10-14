# Policy 1

## Build and deploy policy
```
opa build -t wasm -e policy/main common/request.rego policy1/deny.rego
tar -xvzf bundle.tar.gz /policy.wasm
kwctl annotate policy.wasm --metadata-path common/metadata.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/my-policy:latest
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
