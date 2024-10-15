#!/bin/bash

minikube kubectl -- get pods -n kubewarden | grep -q kubewarden-controller