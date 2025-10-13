resource "azurerm_kubernetes_cluster" "aks" {
  for_each            = var.aks_clusters
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  dynamic "default_node_pool" {
    for_each = var.node_pools
    content {
      name       = default_node_pool.value.name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
      max_pods = default_node_pool.value.max_pods
    }

  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
