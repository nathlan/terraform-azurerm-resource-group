terraform {
  required_version = ">= 1.9.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.71.0, < 5.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "../.."

  workload = "webapp"
  env      = "prod"
  team     = "finance"
  location = "australiaeast"

  tags = {
    ManagedBy  = "Terraform"
    CostCenter = "12345"
  }
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}
