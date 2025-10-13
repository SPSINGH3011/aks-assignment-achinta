resource_groups = {
  "rg1" = {
    name = "rg-achinta1"
    location = "East US"
  }
}


//aks cluster details
aks_clusters = {
  "cluster1" = {
    name = "aks-achinta1"
    location = "East US"
    resource_group_name = "rg-achinta1"
    dns_prefix = "aks-achinta1"
  }
}

node_pools = {
  "pool1" = {
    name = "default"
    node_count = 1
    vm_size = "Standard_B2ms"
    max_pods = 60
  }
}