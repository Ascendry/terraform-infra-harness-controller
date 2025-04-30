resource "harness_platform_connector_kubernetes" "inheritFromDelegate" {
  identifier  = var.k8s_connector_identifier
  name        = var.k8s_connector_name
  description = "Kubernetes Connector"
  tags        = [var.k8s_cluster_name]
  org_id      = var.k8s_connector_org_identifier

  inherit_from_delegate {
    delegate_selectors = [var.harness_delegate_name]
  }
}