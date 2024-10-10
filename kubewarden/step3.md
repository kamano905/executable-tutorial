# Policy 1

## Build and deploy policy
- `opa build -t wasm -e kubernetes/admission/deny policies/deny.rego`{{exec}}
- `nohup python3 -m http.server`{{exec}}