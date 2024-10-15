
### Build and deploy policy
```
cd policy1
opa build -t wasm -e policy/main ../common/request.rego deny-privileged-policy.rego
tar -xvzf bundle.tar.gz /policy.wasm
kwctl annotate policy.wasm --metadata-path metadata1.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/policy1:latest
cd ..
```{{exec}}

### Apply policy
- Get cluster IP address of the local registry
  - `kubectl get svc/registry -n kube-system`{{exec}}
- Open policy declaration files and edit IP address
  - `vi common/policy-server.yaml`{{exec}}
  - `vi policy1/policy1.yaml`{{exec}}
- Apply policies
  - `kubectl apply -f common/policy-server.yaml`{{exec}}
  - `kubectl apply -f policy1/policy1.yaml`{{exec}}

Execute `kubectl get clusteradmissionpolicy.policies.kubewarden.io`{{exec}} and wait until the STATUS of created policy becomes active.

### Try to create privileged pod
Create no-privileged-pod
- `kubectl apply -f policy1/no-privileged-pod.yaml`{{exec}}
Expected outcome is `pod/no-privileged-pod created`{{}}

Create privileged-pod that is prohobited to create
`kubectl apply -f policy1/privileged-pod.yaml`{{exec}}
Expected outcome contains a message `Privileged mode is not allowed for pod privileged-pod`{{}}
