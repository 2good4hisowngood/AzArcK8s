terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}
provider "azurerm" {
  # Configuration options
  features {}
  client_id = var.client_id
  client_secret = var.client_secret
  subscription_id = var.subscription_id
  tenant_id = var.tenant_id
}
resource "azurerm_resource_group" "example" {
  name     = "${var.prefix}-rg"
  location = var.location
}
# Issue #3
data "azurerm_arc_machine" "machine-1" {
  name                = var.machine-1-name
  resource_group_name = "home"
}