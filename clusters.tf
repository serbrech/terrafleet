
resource "azurerm_kubernetes_cluster" "linux" { 
  count = local.cluster_count
  name = "cluster-${local.cluster_locations[count.index % local.region_count]}-${count.index}"
  location            = local.cluster_locations[count.index % local.region_count]
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "terraflt"
  kubernetes_version  = "1.26.10"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_DS4_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Terraform Demo"
  }

  lifecycle {
    ignore_changes = [
      kubernetes_version,
      microsoft_defender
    ]
  }
}

output "client_certificate" {
  value     = [for i in azurerm_kubernetes_cluster.linux: i.kube_config.0.client_certificate]
  sensitive = true
}

output "kube_config" {
  value = [for i in azurerm_kubernetes_cluster.linux : i.kube_config_raw]

  sensitive = true
}