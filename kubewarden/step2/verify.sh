#!/bin/bash

kubectl get pods -n kubewarden | grep -q kubewarden-controller
curl localhost:5000/v2/