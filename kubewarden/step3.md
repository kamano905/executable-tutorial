# Policy 1

## Build and deploy policy
- `opa build -t wasm -e kubernetes/admission/deny policies/deny.rego`{{exec}}
- `tar -xvzf bundle.tar.gz`{{exec}}
- `kubectl create configmap privileged-pod-policy --from-file=policy.wasm`{{exec}}

## Apply policy
- `kubectl apply -f policies/policy1.yaml`{{exec}}

## Try to create privileged pod
- `kubectl run privileged-pod --image=nginx --privileged`{{exec}}