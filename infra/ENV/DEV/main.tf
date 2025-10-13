locals {
  tags = {
    env = "dev"
  }
}

module "resource_groups" {
  source = "../../rg"
  resource_groups = var.resource_groups
  tags = local.tags
}

module "aks" {
  source = "../../aks"
  aks_clusters = var.aks_clusters
  node_pools = var.node_pools
  tags = local.tags
  depends_on = [ module.resource_groups ]
}