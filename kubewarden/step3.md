When creating a Pod in Kubernetes, it is crucial to ensure that it is deployed in accordance with security standards. There are three levels of security policies: privileged, baseline, and restricted. The privileged level allows almost all processes to be executed, and therefore, is generally not recommended.  So, let’s create a policy that prohibits the creation of privileged pods in Kubernetes.

### Create and Build Policy
Create a new file `vi ~/policy1/deny-privileged-policy.rego`{{exec}} and write the policy below.
```
package kubernetes.admission

deny[msg] {
    input.request.kind.kind == "Pod"
    container := input.request.object.spec.containers[_]
    container.securityContext.privileged == true
    msg := sprintf("Privileged mode is not allowed for pod %s", [input.request.object.metadata.name])
}
```{{copy}}

Use OPA to build rego files into wasm file.
```
cd policy1
opa build -t wasm -e policy/main ../common/request.rego deny-privileged-policy.rego
tar -xvzf bundle.tar.gz /policy.wasm
```{{exec}}

Add metadata to `policy.wasm`{{}} and push to local registry.
```
kwctl annotate policy.wasm --metadata-path metadata1.yaml --output-path annotated-policy.wasm
kwctl push annotated-policy.wasm localhost:5000/policy1:latest
cd ..
```{{exec}}

### Apply policy
Get cluster IP address of the local registry
```
kubectl get svc/registry -n kube-system
```{{exec}}
Open policy declaration files and edit `<CLUSTER-IP of registry>`
```
vi common/policy-server.yaml
```{{exec}}
```
vi policy1/policy1.yaml
```{{exec}}
Apply policies
```
kubectl apply -f common/policy-server.yaml
```{{exec}}
```
kubectl apply -f policy1/policy1.yaml
```{{exec}}

Execute `kubectl get clusteradmissionpolicy.policies.kubewarden.io`{{exec}} and wait until the STATUS of created policy becomes active.

### Now let's test the Policy !
#### Create Pod which is not privileged (This Pod should be created)
```
kubectl apply -f policy1/no-privileged-pod.yaml
```{{exec}}

Expected outcome is `pod/no-privileged-pod created`{{}}

#### Create privileged-pod (The creation of this Pod should be prohibited)

```
kubectl apply -f policy1/privileged-pod.yaml
```{{exec}}

Expected outcome contains a message `Privileged mode is not allowed for pod privileged-pod`{{}}
