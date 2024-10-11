# Policy example

## Build and deploy policy
- `opa build -t wasm -e kubernetes/admission/deny policies/policy.rego request.rego`{{exec}}
- `tar -xvzf bundle.tar.gz /policyexample.wasm`{{exec}}
- $ kwctl run -e opa --request-path data/other-ns.json policyexample.wasm | jq
- $ kwctl run -e opa --request-path data/default-ns.json policyexample.wasm | jq