module "delegate" {
  source = "harness/harness-delegate/kubernetes"
  version = "0.1.8"

  account_id = var.harness_account_id
  delegate_token = var.harness_delegate_token
  delegate_name = var.harness_delegate_name
  deploy_mode = var.harness_delegate_mode
  namespace = var.harness_namespace
  manager_endpoint = "https://app.harness.io"
  delegate_image = var.harness_delegate_image
  replicas = var.harness_delegate_replicas
  upgrader_enabled = var.harness_delegate_upgrade_enabled
}

module "harness_platform_connector_kubernetes" {
  source = "./module/kubernetes"
  k8s_connector_identifier = ""
  k8s_cluster_name = ""
  k8s_connector_name = ""
  harness_delegate_name = ""
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}