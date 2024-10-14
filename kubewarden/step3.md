# Policy 1

## Build and deploy policy
```
opa build -t wasm -e kubernetes/admission/deny policies/deny.rego
tar -xvzf bundle.tar.gz
kwctl annotate policy.wasm --metadata-path policies/metadata.yaml --output-path annotated-policy1.wasm
kwctl push annotated-policy1.wasm localhost:5000/my-policy:latest
```{{exec}}

## Apply policy
- Get cluster IP address of the local registry
  - `kubectl get svc/registry -n kube-system`{{exec}}
- Open policy declaration files and edit IP address
  - `vi policies/policy-server.yaml`
  - `vi policies/policy1.yaml`
- Apply policies
  - `kubectl apply -f policies/policy-server.yaml`{{exec}}
  - `kubectl apply -f policies/policy1.yaml`{{exec}}

## Try to create privileged pod
- `kubectl run privileged-pod --image=nginx --privileged`{{exec}}