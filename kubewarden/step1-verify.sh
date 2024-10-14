#!/bin/bash

kubectl version
helm version
helm repo list | grep -q kubewarden
opa version
