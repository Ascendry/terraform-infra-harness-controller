resource "harness_platform_environment" "example" {
  identifier  = var.harness_env_identifier
  name        = var.harness_env_name
  org_id      = var.harness_org_identifier
  project_id  = var.harness_env_project_identifier
  tags        = [var.harness_env_name]
  type        = var.harness_env_type
  description = ""

  yaml = templatefile("${path.module}/environment.yaml.tpl", {
    envName           = var.harness_env_name
    envIdentifier     = var.harness_env_identifier
    orgIdentifier     = var.harness_org_identifier
    projectIdentifier = var.harness_env_project_identifier
    envType           = var.harness_env_type
  })
}