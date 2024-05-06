variable "resource_group_name" {
  type    = string
  default = "michalResourceGroup"
}

variable "location" {
  type    = string
  default = "East Europe"
}

variable "service_plan_name" {
  type    = string
  default = "michalServicePlan"
}

variable "function_app_name" {
  type    = string
  default = "michalFunctionApp"
}

variable "function_name" {
  type    = string
  default = "michalFunction"
}
