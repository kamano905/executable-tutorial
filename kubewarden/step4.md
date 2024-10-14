### Build and deploy policy
```
cd policy2
opa build -t wasm -e policy/main ../common/request.rego deny-removal-policy.rego
tar -xvzf bundle.tar.gz /policy.wasm
kwctl annotate policy.wasm --metadata-path metadata2.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/policy2:latest
cd ..
```{{exec}}

### Apply policy
- Get cluster IP address of the local registry
  - `kubectl get svc/registry -n kube-system`{{exec}}
- Open policy declaration files and edit IP address
  - `vi policy2/policy2.yaml`{{exec}}
- Apply policies
  - `kubectl apply -f policy2/policy2.yaml`{{exec}}

### Create protected pod
- `kubectl apply -f policy2/protected-pod.yaml`{{exec}}