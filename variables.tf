variable "harness_org_identifier" {
  type = string
}

variable "harness_project_identifier" {
  type = string
}

variable "harness_account_id" {
  type = string
  sensitive = true
}

variable "harness_delegate_token" {
  sensitive = true
  type      = string
}

variable "harness_delegate_name" {
  type = string
}

variable "harness_delegate_mode" {
  type = string
}

variable "harness_namespace" {
  type = string
}

variable "harness_delegate_image" {
  type = string
}

variable "harness_delegate_replicas" {
  type = number
}
variable "harness_delegate_upgrade_enabled" {
  type = bool
}

variable "harness_platform_api_key" {
  type      = string
  sensitive = true
}

variable "harness_env_name" {
  type = string
}

variable "harness_env_type" {
  type = string
}

variable "harness_infrastructure_type" {
  type = string
}

variable "harness_infrastructure_deployment_type" {
  type = string
}

variable "kubernetes_host" {
  type = string
  sensitive = true
}

variable "kubernetes_ca_certificate"{
  type = string
  sensitive = true
}

variable "kubernetes_token"{
  type = string
  sensitive = true
}