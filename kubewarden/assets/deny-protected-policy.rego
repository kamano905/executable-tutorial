package kubernetes.admission

deny[msg] {
    input.request.kind.kind == "Pod"
    input.request.action == "delete"
    input.request.object.metadata.labels.protected == "true"
    msg := sprintf("Deleting protected pod %s is not allowed", [input.request.object.metadata.name])
}