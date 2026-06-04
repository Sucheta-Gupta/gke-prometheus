resource "helm_release" "monitoring" {
    name = "monitoring"
    namespace = "prometheus"
    create_namespace = "true"
    repository = "https://prometheus-community.github.io/helm-charts"
    chart = "kube-prometheus-stack"
    values = [
        file("${path.module}/values.yaml")
    ]
    timeout = 300
    version = "84.1.2"
}
