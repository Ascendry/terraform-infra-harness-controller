resource "harness_platform_infrastructure" "example" {
  identifier      = var.harness_infrastructure_identifier
  name            = var.harness_infrastructure_name
  org_id          = var.harness_infrastructure_org_identifier
  project_id      = var.harness_infrastructure_project_identifier
  env_id          = var.harness_infrastructure_env_identifier
  type            = var.harness_infrastructure_type
  deployment_type = var.harness_infrastructure_deployment_type
  yaml = templatefile("${path.module}/infrastructure-definition.yaml.tpl", {
    infrastructureName             = var.harness_infrastructure_name
    infrastructureIdentifier       = var.harness_infrastructure_identifier
    orgIdentifier                  = var.harness_infrastructure_org_identifier
    projectIdentifier              = var.harness_infrastructure_project_identifier
    envIdentifier                  = var.harness_infrastructure_env_identifier
    deploymentType                 = var.harness_infrastructure_deployment_type
    type                           = var.harness_infrastructure_type
    connectorRef                   = var.harness_infrastructure_connector_identifier
    namespace                      = var.harness_infrastructure_namespace
    allow_simultaneous_deployments = var.harness_infrastructure_allow_simultaneous_deployments
  })
}