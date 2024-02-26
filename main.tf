terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.92.0"
    }
    azapi = {
      source = "Azure/azapi"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "ster-terrafleet-1"
  location = local.fleet_location
}

locals{
  cluster_count = 10
  fleet_location = "westcentralus"
  cluster_locations = ["westcentralus", "eastus", "westus", "southeastasia", "brazilsouth", "westus2", "uksouth", "ukwest", "australiaeast"]
  groups = [ "dev", "staging", "prod-1", "prod-2"]
  region_count = 4
}