variable "workload" {
  type        = string
  description = "The workload name for naming convention."
  default     = null
}

variable "env" {
  type        = string
  description = "The environment identifier for naming convention (e.g., 'dev', 'prod')."
  default     = null
}

variable "team" {
  type        = string
  description = "The team identifier for naming convention."
  default     = null
}

variable "location" {
  type        = string
  description = "The Azure region where the resource group will be created. Must be either australiaeast or australiacentral."

  validation {
    condition     = contains(["australiaeast", "australiacentral"], var.location)
    error_message = "Location must be either 'australiaeast' or 'australiacentral'."
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource group."
  default     = {}
}

variable "lock" {
  type = object({
    kind = string
    name = optional(string, null)
  })
  description = <<-EOT
    Controls the Resource Lock configuration for this resource group.
    - `kind` - (Required) The type of lock. Possible values are "CanNotDelete" and "ReadOnly".
    - `name` - (Optional) The name of the lock. If not specified, a name will be generated based on the kind value.
  EOT
  default     = null

  validation {
    condition     = var.lock == null || contains(["CanNotDelete", "ReadOnly"], var.lock.kind)
    error_message = "Lock kind must be either 'CanNotDelete' or 'ReadOnly'."
  }
}

variable "role_assignments" {
  type = map(object({
    role_definition_id_or_name             = string
    principal_id                           = string
    description                            = optional(string, null)
    skip_service_principal_aad_check       = optional(bool, false)
    condition                              = optional(string, null)
    condition_version                      = optional(string, null)
    delegated_managed_identity_resource_id = optional(string, null)
    principal_type                         = optional(string, null)
  }))
  description = <<-EOT
    A map of role assignments to create on the resource group.
    - `role_definition_id_or_name` - (Required) The ID or name of the role definition to assign to the principal.
    - `principal_id` - (Required) The ID of the principal to assign the role to.
    - `description` - (Optional) The description of the role assignment.
    - `skip_service_principal_aad_check` - (Optional) If set to true, skips the Azure Active Directory check. Defaults to false.
    - `condition` - (Optional) The condition which will be used to scope the role assignment.
    - `condition_version` - (Optional) The version of the condition syntax. Valid values are '2.0'.
    - `delegated_managed_identity_resource_id` - (Optional) The delegated Azure Resource Id which contains a Managed Identity.
    - `principal_type` - (Optional) The type of principal. Possible values are User, Group, ServicePrincipal.
  EOT
  default     = {}
}

variable "enable_telemetry" {
  type        = bool
  description = "Controls whether telemetry is enabled for the module. For more information see https://aka.ms/avm/telemetryinfo."
  default     = true
}
