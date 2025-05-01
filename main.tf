provider "harness" {
  endpoint         = "https://app.harness.io/gateway"
  account_id       = var.harness_account_id
  platform_api_key = var.harness_platform_api_key
}

provider "helm" {
  kubernetes {
    # auto-read KUBECONFIG from TF Cloud
    host                   = var.kubernetes_host
    token                  = var.kubernetes_token
    cluster_ca_certificate = base64decode(var.kubernetes_ca_certificate)
  }

}

locals {
  k8s_connector_id          = replace(var.harness_delegate_name, "-", "_")
  harness_env_id            = replace(var.harness_delegate_name, "-", "_")
  harness_infrastructure_id = replace(var.harness_delegate_name, "-", "_")
}
module "delegate" {
  source  = "harness/harness-delegate/kubernetes"
  version = "0.1.8"

  account_id       = var.harness_account_id
  delegate_token   = var.harness_delegate_token
  delegate_name    = var.harness_delegate_name
  deploy_mode      = var.harness_delegate_mode
  namespace        = var.harness_namespace
  manager_endpoint = "https://app.harness.io"
  delegate_image   = var.harness_delegate_image
  replicas         = var.harness_delegate_replicas
  upgrader_enabled = var.harness_delegate_upgrade_enabled
}

module "harness_platform_connector_kubernetes" {
  source                       = "./module/kubernetes"
  k8s_connector_identifier     = local.k8s_connector_id
  k8s_cluster_name             = var.harness_delegate_name
  k8s_connector_name           = var.harness_delegate_name
  harness_delegate_name        = var.harness_delegate_name
  k8s_connector_org_identifier = var.harness_org_identifier
  depends_on                   = [module.delegate]
}

module "harness_platform_environment" {
  source                 = "./module/environment"
  harness_env_name       = var.harness_env_name
  harness_env_identifier = local.harness_env_id
  harness_org_identifier = var.harness_org_identifier
  harness_env_type       = var.harness_env_type # PreProduction
  depends_on             = [module.harness_platform_connector_kubernetes]
}

module "harness_platform_infrastructure" {
  source                                                = "./module/infrastructure"
  harness_infrastructure_identifier                     = local.harness_infrastructure_id
  harness_infrastructure_name                           = var.harness_delegate_name
  harness_infrastructure_org_identifier                 = var.harness_org_identifier
  harness_infrastructure_env_identifier                 = local.harness_env_id
  harness_infrastructure_type                           = var.harness_infrastructure_type            #KUBERNETES
  harness_infrastructure_deployment_type                = var.harness_infrastructure_deployment_type #KubernetesDirect
  harness_infrastructure_namespace                      = var.harness_delegate_name
  harness_infrastructure_allow_simultaneous_deployments = false
  harness_infrastructure_connector_identifier           = var.harness_delegate_name
  depends_on                                            = [module.harness_platform_environment]
}