#!/bin/bash

helm version
helm repo list | grep -q kubewarden
opa version
