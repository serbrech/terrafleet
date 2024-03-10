
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

resource "azapi_resource" "updaterun-cp" {
  schema_validation_enabled = false //support for preview API
  type      = "Microsoft.ContainerService/fleets/updateRuns@2024-02-02-preview"
  parent_id = azapi_resource.flt.id
  name      = "updaterun-cp-1-27-7"

  body = jsonencode({
    properties = {
        managedClusterUpdate: {
            upgrade: {
                kubernetesVersion: "1.27.7",
                type: "ControlPlaneOnly"
            }
        },
        updateStrategyId: "/subscriptions/8ecadfc9-d1a3-4ea4-b844-0d9f87e4d7c8/resourceGroups/ster-terrafleet-1/providers/Microsoft.ContainerService/fleets/terrafleet-1/updateStrategies/fast-deploy-in-stages"
     }
  })
  lifecycle {
    ignore_changes = [
      body
    ]
  }
  ignore_missing_property = true
}