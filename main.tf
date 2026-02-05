# Azure Resource Group Module
# This module wraps the Azure Verified Module (AVM) for Resource Groups
# with opinionated defaults and additional validation

module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "~> 0.2.2"

  name             = var.name
  location         = var.location
  tags             = var.tags
  lock             = var.lock
  role_assignments = var.role_assignments
  enable_telemetry = var.enable_telemetry
}
