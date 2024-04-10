
resource "azapi_resource" "updaterun" {
  schema_validation_enabled = false //support for preview API
  type      = "Microsoft.ContainerService/fleets/updateRuns@2024-02-02-preview"
  parent_id = azapi_resource.flt.id
  name      = "1-27-7-dev-staging"

  body = jsonencode({
    properties = {
        managedClusterUpdate: {
            "upgrade": {
                "kubernetesVersion": "1.27.7",
                "type": "Full"
            },
            nodeImageSelection = {
                type = "Consistent"
            }
        }
     }
  })
  lifecycle {
    ignore_changes = [
      body
    ]
  }
  ignore_missing_property = true
}