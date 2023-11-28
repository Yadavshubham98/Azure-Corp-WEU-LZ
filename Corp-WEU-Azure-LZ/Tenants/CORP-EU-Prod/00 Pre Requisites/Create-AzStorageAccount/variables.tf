locals {
  rg-name  = "corp-rg-weu-prod-shared-terraform"
  location = "westeurope"
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "tf_subscription_id" {
  type = string
}