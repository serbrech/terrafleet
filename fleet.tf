resource "azapi_resource" "flt" {
  type      = "Microsoft.ContainerService/fleets@2023-10-15"
  parent_id = azurerm_resource_group.rg.id
  name      = "terrafleet-1"

  body = jsonencode({
    location = local.fleet_location
    properties = { }
  })
}

resource "azurerm_kubernetes_fleet_member" "flt" {
  count = local.cluster_count
  kubernetes_cluster_id = azurerm_kubernetes_cluster.linux[count.index].id
  kubernetes_fleet_id   = azapi_resource.flt.id
  name                  = "fleetmember-${count.index}"
  group                = local.groups[count.index % length(local.groups)-1]
}