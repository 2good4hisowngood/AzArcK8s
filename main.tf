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

# Issue #4


# resource "azurerm_policy_virtual_machine_configuration_assignment" "example" {
#   name               = "AzureWindowsBaseline"
#   location           = data.azurerm_arc_machine.machine-1.location
#   virtual_machine_id = data.azurerm_arc_machine.machine-1.id

#   configuration {
#     assignment_type = "ApplyAndMonitor"
#     version         = "1.*"

#     parameter {
#       name  = "Minimum Password Length;ExpectedValue"
#       value = "16"
#     }
#     parameter {
#       name  = "Minimum Password Age;ExpectedValue"
#       value = "0"
#     }
#     parameter {
#       name  = "Maximum Password Age;ExpectedValue"
#       value = "30,45"
#     }
#     parameter {
#       name  = "Enforce Password History;ExpectedValue"
#       value = "10"
#     }
#     parameter {
#       name  = "Password Must Meet Complexity Requirements;ExpectedValue"
#       value = "1"
#     }
#   }
# }

# resource "azurerm_automanage_configuration" "example" { # To Use this you have to enable feature
#   name                = "example-acmp"
#   resource_group_name = azurerm_resource_group.example.name
#   location            = azurerm_resource_group.example.location

#   antimalware {
#     exclusions {
#       extensions = "exe;dll"
#       paths      = "C:\\Windows\\Temp;D:\\Temp"
#       processes  = "svchost.exe;notepad.exe"
#     }

#     real_time_protection_enabled   = true
#     scheduled_scan_enabled         = true
#     scheduled_scan_type            = "Quick"
#     scheduled_scan_day             = 1
#     scheduled_scan_time_in_minutes = 1339
#   }

#   azure_security_baseline {
#     assignment_type = "ApplyAndAutoCorrect"
#   }

#   automation_account_enabled = true

#   backup {
#     policy_name                        = "${var.prefix}-backup-policy"
#     time_zone                          = "UTC"
#     instant_rp_retention_range_in_days = 2

#     schedule_policy {
#       schedule_run_frequency = "Daily"
#       schedule_run_days      = ["Monday", "Tuesday"]
#       schedule_run_times     = ["12:00"]
#       schedule_policy_type   = "SimpleSchedulePolicy"
#     }

#     retention_policy {
#       retention_policy_type = "LongTermRetentionPolicy"

#       daily_schedule {
#         retention_times = ["12:00"]
#         retention_duration {
#           count         = 7
#           duration_type = "Days"
#         }
#       }

#       weekly_schedule {
#         retention_times = ["14:00"]
#         retention_duration {
#           count         = 4
#           duration_type = "Weeks"
#         }
#       }
#     }
#   }

#   boot_diagnostics_enabled    = true
#   defender_for_cloud_enabled  = true
#   guest_configuration_enabled = true
#   log_analytics_enabled       = true
#   status_change_alert_enabled = true

#   tags = {
#     "env" = "test"
#   }
# }






# resource "azurerm_arc_kubernetes_cluster" "anton" {
#   name                         = "example-akcc"
#   resource_group_name          = azurerm_resource_group.AzureML.name
#   location                     = azurerm_resource_group.AzureML.location
#   agent_public_key_certificate = filebase64("testdata/public.cer")

#   identity {
#     type = "SystemAssigned"
#   }

#   tags = {
#     ENV = "Test"
#   }
# }

# request was az k8s-extension create -n amlarc-extension --extension-type Microsoft.AzureML.Kubernetes --configuration-settings enableTraining=True --cluster-type connectedClusters --resource-group home --cluster-name anton 