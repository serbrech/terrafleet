resource "azurerm_kubernetes_fleet_member" "flt" {
  count = local.cluster_count
  kubernetes_cluster_id = azurerm_kubernetes_cluster.linux[count.index].id
  kubernetes_fleet_id   = azapi_resource.flt.id
  name                  = "fleetmember-${count.index}"
  group                = local.groups[count.index % length(local.groups)]
}