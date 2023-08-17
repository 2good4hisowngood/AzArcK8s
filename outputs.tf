output "arc_host_name" {
  value = data.azurerm_arc_machine.machine-1.machine_fqdn
  description = "Machine name of Azure Arc Host"
}