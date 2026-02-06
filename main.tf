module "azname" {
  source  = "Azure/naming/azurerm"
  version = "~> 0.4.3"
  suffix  = local.name_parts
}

module "resource_group" {
  source  = "Azure/avm-res-resources-resourcegroup/azurerm"
  version = "~> 0.2.2"

  name             = local.rg_name
  location         = var.location
  tags             = local.all_tags
  lock             = var.lock
  role_assignments = var.role_assignments
  enable_telemetry = var.enable_telemetry
}

locals {
  name_parts     = [for p in [var.workload, var.env, var.team] : p if p != null && p != ""]
  use_convention = length(local.name_parts) > 0
  rg_name        = local.use_convention ? module.azname.resource_group.name : var.name
  ctx_tags       = { for k, v in { "Workload" = var.workload, "Env" = var.env, "Team" = var.team } : k => v if v != null && v != "" }
  all_tags       = merge(local.ctx_tags, var.tags)
}
