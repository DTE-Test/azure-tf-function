# variable "function_app_name" {
#   type = string
# }

# variable "storage_account_prefix" {
#   type = string
# }

# variable "resource_group_name" {
#   type = string
# }

# variable "location" {
#   type = string
# }

# variable "cosmos_db_connection_string" {
#   type = string
# }

# variable "app_insights_name" {
#   type = string
# }

# variable "environment" {
#   type = string
# }

#########newly added variables ##########

variable "function_app_name" {
  type = string
}

variable "storage_account_prefix" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "app_insights_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "extra_app_settings" {
  type    = map(string)
  default = {}
}
