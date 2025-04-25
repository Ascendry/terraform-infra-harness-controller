variable "harness_account_id" {
  type = string
}

variable "harness_delegate_token" {
  sensitive = true
  type = string
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