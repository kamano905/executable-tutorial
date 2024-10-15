In this step, we aim to create a policy that enable to create pods protected from deletion.

### Build and deploy policy
Create a new file `vi ~/policy2/deny-protected-policy.rego`{{exec}} and write the policy below.
```deny-protected-policy.rego
package kubernetes.admission

deny[msg] {
    input.request.kind.kind == "Pod"
    input.request.operation == "DELETE"
    input.request.oldObject.metadata.labels.protected == "true"
    msg := sprintf("Deleting protected pod %s is not allowed", [input.request.oldObject.metadata.name])
}
```{{copy}}

Build and deploy the policy.
```
cd policy2
opa build -t wasm -e policy/main ../common/request.rego deny-protected-policy.rego
tar -xvzf bundle.tar.gz /policy.wasm
kwctl annotate policy.wasm --metadata-path metadata2.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/policy2:latest
cd ..
```{{exec}}

### Apply policy
- Get cluster IP address of the local registry
  - `kubectl get svc/registry -n kube-system`{{exec}}
- Open policy declaration files and edit `<CLUSTER-IP of registry>`
  - `vi policy2/policy2.yaml`{{exec}}
- Apply policies
  - `kubectl apply -f policy2/policy2.yaml`{{exec}}

Execute `kubectl get clusteradmissionpolicy.policies.kubewarden.io`{{exec}} and wait until the STATUS of created policy becomes active.

### Try to delete protected pod
Create protected pod.
- `kubectl apply -f policy2/protected-pod.yaml`{{exec}}

Try to delete it.
- `kubectl delete pod/protected-pod`{{exec}}

Expected outcome contains `Deleting protected pod protected-pod is not allowed`{{}}