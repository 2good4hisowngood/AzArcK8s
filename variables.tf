variable "client_id" {
    description = "value of client_id"
}

variable "client_secret" {
    description = "value of client_secret"
}

variable "tenant_id" {
    description = "value of tenant_id"
}

variable "subscription_id" {
    description = "value of subscription_id"
}

variable "location" {
    type = string
    description = "value of location"
    default = "eastus"
}

variable "prefix" {
    description = "Prefix to attach to related resources"
    default = "AzArck8s"
}

variable "machine-1-name" {
    description = "Name of the first machine"
    default = "DESKTOP-2FPSMBA"
}

