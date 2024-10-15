#!/bin/bash

kubectl get pods -n kubewarden | grep -q kubewarden-controller