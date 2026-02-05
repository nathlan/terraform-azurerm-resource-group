# Azure Resource Group Terraform Module

This module creates an Azure Resource Group using the Azure Verified Module (AVM) with additional validation and opinionated defaults.

## Usage

```hcl
module "resource_group" {
  source = "github.com/nathlan/terraform-azurerm-resource-group"

  name     = "my-resource-group"
  location = "eastus"
  tags = {
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.9.0, < 2.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement_azurerm) | >= 3.71.0, < 5.0.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_resource_group"></a> [resource_group](#module_resource_group) | Azure/avm-res-resources-resourcegroup/azurerm | ~> 0.2.2 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_telemetry"></a> [enable_telemetry](#input_enable_telemetry) | Controls whether telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input_location) | The Azure region where the resource group will be created. Must be either australiaeast or australiacentral. | `string` | n/a | yes |
| <a name="input_lock"></a> [lock](#input_lock) | Controls the Resource Lock configuration for this resource group.<br/>- `kind` - (Required) The type of lock. Possible values are "CanNotDelete" and "ReadOnly".<br/>- `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value. | <pre>object({<br/>    kind = string<br/>    name = optional(string, null)<br/>  })</pre> | `null` | no |
| <a name="input_name"></a> [name](#input_name) | The name of the resource group. Must be unique within the subscription. | `string` | n/a | yes |
| <a name="input_role_assignments"></a> [role_assignments](#input_role_assignments) | A map of role assignments to create on the resource group.<br/>- `role_definition_id_or_name` - (Required) The ID or name of the role definition to assign to the principal.<br/>- `principal_id` - (Required) The ID of the principal to assign the role to.<br/>- `description` - (Optional) The description of the role assignment.<br/>- `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check. Defaults to false.<br/>- `condition` - (Optional) The condition which will be used to scope the role assignment.<br/>- `condition_version` - (Optional) The version of the condition syntax. Valid values are '2.0'.<br/>- `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity.<br/>- `principal_type` - (Optional) The type of principal. Possible values are User, Group, ServicePrincipal. | <pre>map(object({<br/>    role_definition_id_or_name             = string<br/>    principal_id                           = string<br/>    description                            = optional(string, null)<br/>    skip_service_principal_aad_check       = optional(bool, false)<br/>    condition                              = optional(string, null)<br/>    condition_version                      = optional(string, null)<br/>    delegated_managed_identity_resource_id = optional(string, null)<br/>    principal_type                         = optional(string, null)<br/>  }))</pre> | `{}` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A mapping of tags to assign to the resource group. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource"></a> [resource](#output_resource) | The full resource group object from the Azure Verified Module. |
| <a name="output_resource_group_id"></a> [resource_group_id](#output_resource_group_id) | The ID of the resource group. |
| <a name="output_resource_group_location"></a> [resource_group_location](#output_resource_group_location) | The location of the resource group. |
| <a name="output_resource_group_name"></a> [resource_group_name](#output_resource_group_name) | The name of the resource group. |
<!-- END_TF_DOCS -->
