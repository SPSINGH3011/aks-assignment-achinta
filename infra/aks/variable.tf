variable "aks_clusters" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
  }))
}

variable "node_pools" {
  type = map(object({
    name       = string
    node_count = number
    vm_size    = string
    max_pods   = number
  }))
}

variable "tags" {
  
}