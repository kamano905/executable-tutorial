# Policy 1

## Build and deploy policy
- `opa build -t wasm -e kubernetes/admission/deny policies/deny.rego`{{exec}}
- `tar -xvzf bundle.tar.gz`{{exec}}
- `kwctl annotate policy.wasm --metadata-path policies/metadata.yaml --output-path annotated-policy1.wasm`{{exec}}`
- `kwctl push annotated-policy1.wasm localhost:5000/my-policy:latest`{{exec}}


## Apply policy
- `kubectl apply -f policies/policy1.yaml`{{exec}}

## Try to create privileged pod
- `kubectl run privileged-pod --image=nginx --privileged`{{exec}}