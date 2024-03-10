resource "azapi_resource" "flt" {
  schema_validation_enabled = false //support for preview API
  type      = "Microsoft.ContainerService/fleets@2024-02-02-preview"
  parent_id = azurerm_resource_group.rg.id
  name      = "terrafleet-1"

  body = jsonencode({
    location = local.fleet_location
    properties = { }
  })
}