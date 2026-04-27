resource "helm_release" "monitoring" {
    name = "monitoring"
    namespace = "prometheus"
    create_namespace = "true"
    repository = "https://prometheus-community.github.io/helm-charts"
    chart = "kube-prometheus-stack"
    values = [
        file("${path.module}/values.yaml")
    ]
    timeout = 1200
}