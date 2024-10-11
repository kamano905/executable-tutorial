package kubernetes.admission

deny[msg] {
	input.request.object.metadata.namespace == "default"
	msg := "it is forbidden to use the default namespace"
}
