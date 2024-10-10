# Setup kubewarden

## Install kubewarden
- `helm repo add kubewarden https://charts.kubewarden.io`{{exec}}
- `helm repo update kubewarden`{{exec}}
- `helm install --wait -n kubewarden --create-namespace kubewarden-crds kubewarden/kubewarden-crds`{{exec}}
- `helm install --wait -n kubewarden kubewarden-controller kubewarden/kubewarden-controller`{{exec}}
- `helm install --wait -n kubewarden kubewarden-defaults kubewarden/kubewarden-defaults`{{exec}}

## Install OPA
- `curl -L -o opa https://github.com/open-policy-agent/opa/releases/download/v0.11.0/opa_linux_amd64`{{exec}}
- `chmod 755 ./opa`{{exec}}
- `sudo mv ./opa /opt/opa`{{exec}}
- `echo 'export PATH=$PATH:/opt/opa' >> ~/.bashrc && source ~/.bashrc`{{exec}}
