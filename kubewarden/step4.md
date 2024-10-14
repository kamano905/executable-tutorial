# Policy example

## Build and deploy policy
- `kubectl get nodes`
- `helm repo add cockroachdb https://charts.cockroachdb.com/`{{exec}}
- `helm repo update`{{exec}}
- `helm install cockroachdb-operator cockroachdb/cockroachdb-operator`{{exec}}
- `kubectl get pods -n cockroachdb`{{exec}}
- `kubectl create namespace cockroachdb`{{exec}}
- `kubectl apply -f cockroachdb-cluster.yaml -n cockroachdb`{{exec}}
- `kubectl get cockroachdbcluster -n cockroachdb`{{exec}}
- `kubectl port-forward service/cockroachdb-public -n cockroachdb 8080:8080`{{exec}}
- `kubectl run -it cockroachdb-client --image=cockroachdb/cockroachdb --rm --restart=Never -- sql --insecure --host=cockroachdb-public.cockroachdb`{{exec}}
-  
- `opa build -t wasm -e kubernetes/admission/deny policies/policy.rego request.rego`{{exec}}
- `tar -xvzf bundle.tar.gz /policyexample.wasm`{{exec}}
- $ kwctl run -e opa --request-path data/other-ns.json policyexample.wasm | jq `{{exec}}
- $ kwctl run -e opa --request-path data/default-ns.json policyexample.wasm | jq `{{exec}}

-tar -tzf bundle.tar.gz
