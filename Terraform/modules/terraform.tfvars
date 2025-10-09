# Service Principal Credentials
// tenant_id     = "fac6c768-4c4f-4392-b8df-0a9ff482f100"
// client_id     = "b9fa4411-13a1-4a2f-8936-c34e01790423"

# Resource group settings
subscription_id     = "94125ed2-b170-486b-a07a-0006d2d979a9"
resource_group_name = "rg-doc-ai-studio-dev-01"
location            = "eastus"
# tenant_id           = "fac6c768-4c4f-4392-b8df-0a9ff482f100"

#VNET CONFIGURATION
vnets = {
  "vnet1" = {
    name          = "vnet-docaistudio-hc"
    address_space = ["10.240.0.0/12"]
    subnets = {
      "default" = {
        address_prefix = "10.240.0.0/25"
        service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault", "Microsoft.ContainerRegistry"]
        service_delegations = []
        private_endpoint_network_policies_enabled  = false
      },
      # "aks" = {
      #   address_prefix = "10.241.0.0/25"
      #   service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
      #    service_delegations = []
      # },
      # "database" = {
      #   address_prefix = "10.242.0.0/26"
      #   service_endpoints  = ["Microsoft.Storage", "Microsoft.KeyVault"]
      #    service_delegations = []
      # },
    },
    # peerings = {
    #   "devops-aks" = {
    #     remote_virtual_network_id = "/subscriptions/2c3a2863-c048-40f0-be6c-ab87241211a9/resourceGroups/RG_Playground/providers/Microsoft.Network/virtualNetworks/devopsagent-vnet"
    #   }
    # }
  }
}

tags = {
  costmanager = "costmanager"
  team        = "docaistudioteam"
}


# vnets = {
#   "vnet1" = {
#     name          = "vnet-llmstudio-hc-01"
#     address_space = ["10.0.0.0/22"]
#     subnets = {
#       "default" = {
#         address_prefixes = ["10.0.0.0/24"]
#         private_endpoint_network_policies_enabled = false
#         private_link_service_network_policies_enabled = true
#       }
#     }
#     tags = {}
#   }

# vnets = {
#   "vnet1" = {
#     name          = "rg-llmstudio-hc-01-vnet"
#     address_space = ["10.224.0.0/12"]
#     subnets = {
#       "default" = {
#         address_prefix = "10.224.0.0/16"
#         service_endpoints = [
#           "Microsoft.ContainerRegistry"
#         ]
#         private_endpoint_network_policies_enabled = false
#         private_link_service_network_policies_enabled = true
#       },
#       "virtual-node-aci" = {
#         address_prefix = "10.239.0.0/16"
#         delegations = [{
#           name = "aciDelegation"
#           service_delegation = {
#             name    = "Microsoft.ContainerInstance/containerGroups"
#             actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
#           }
#         }]
#         private_endpoint_network_policies_enabled = false
#         private_link_service_network_policies_enabled = true
#       },
#       "ingress-appgateway-subnet" = {
#         address_prefix = "10.225.0.0/16"
#         private_endpoint_network_policies_enabled = false
#         private_link_service_network_policies_enabled = true
#       }
#     },
#     peerings = {
#       "devops-aks" = {
#         remote_virtual_network_id = "/subscriptions/2c3a2863-c048-40f0-be6c-ab87241211a9/resourceGroups/RG_Playground/providers/Microsoft.Network/virtualNetworks/devopsagent-vnet"
#         allow_virtual_network_access = true
#         allow_forwarded_traffic = false
#         allow_gateway_transit = false
#         use_remote_gateways = false
#       }
#     }
#   }
# }

 
#ACR configuration
container_registries = {
  "acr1" = {
    name          = "crdocaistudiohc"
    sku           = "Basic"
    admin_enabled = true
  }
  # You can add more registries as needed:
  # "acr2" = {
  #   name          = "crllmstudio02"
  #   sku           = "Standard"
  #   admin_enabled = true
  # }
}

# Redis Cache Configuration
redis_instances = {
  "redis1" = {
    name                       = "rd-docaistudio-hc"
    sku_name                   = "Basic"
    family                     = "C"
    capacity                   = 0
    enable_non_ssl_port        = false
    minimum_tls_version        = "1.2"
    public_network_access_enabled = true  #Enable public access
    
    maxmemory_reserved              = "30"
    maxmemory_delta                 = "30"
    maxfragmentationmemory_reserved = "30"
    
    create_private_endpoint    = true
    private_endpoint_name      = "pe-rd-docaistudio-hc"
    subnet_name                = "default"
    vnet_key                   = "vnet1"
  }
}

# redis_instances = {
#   "redis1" = {
#     name                       = "rd-llmstudio-hc-01"
#     sku_name                   = "Standard"
#     family                     = "C"
#     capacity                   = 1
#     enable_non_ssl_port        = false
#     minimum_tls_version        = "1.2"
#     public_network_access      = "Disabled"
#     maxmemory_reserved         = "125"
#     maxmemory_delta            = "125"
#     maxfragmentation_reserved  = "125"
#     create_private_endpoint    = true
#     private_endpoint_name      = "pe-rd-llmstudio-hc-01"
#     subnet_id                  = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.Network/virtualNetworks/rg-llmstudio-hc-01-vnet/subnets/default"
#     private_dns_zone_id        = null
#   }

  # "redis2" = {
  #   name                       = "rd-llmstudio-hc-02"
  #   sku_name                   = "Standard"
  #   family                     = "C"
  #   capacity                   = 1
  #   enable_non_ssl_port        = false
  #   minimum_tls_version        = "1.2"
  #   public_network_access      = "Disabled"
  #   maxmemory_reserved         = "125"
  #   maxmemory_delta            = "125"
  #   maxfragmentation_reserved  = "125"
  #   create_private_endpoint    = true
  #   private_endpoint_name      = "pe-rd-llmstudio-hc-02"
  #   subnet_id                  = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.Network/virtualNetworks/rg-llmstudio-hc-01-vnet/subnets/default"
  #   private_dns_zone_id        = null 
  # }
# }

# tags = {
#   Environment = "Production"
#   Project     = "LLMStudio"
# }

#azure key vault configuration
# key_vaults = {
#   "kv1" = {
#     name = "kv-docaistudio-hc"
#     enable_rbac_authorization = true
#     public_network_access_enabled = false
    
#     # Leave access_policies empty initially
#     access_policies = {}
#   }
  
#   # Comment out the second Key Vault if you only want to manage the existing one
#   # "kv2" = {
#   #   name = "kv-llmstudio-hc-02"
#   # }
# }

#azure key vault configuration
key_vaults = {
  "kv1" = {
    name = "kv-docaistudio-hc"
    enable_rbac_authorization = false
    public_network_access_enabled = true
    
    # Private endpoint configuration
    create_private_endpoint = true
    private_endpoint_name = "pe-kv-docaistudio-hc"
    subnet_name = "default"
    vnet_key = "vnet1"
    
    # Leave access_policies empty initially
    access_policies = {}
  }
}

#cosmosdb configuration
# cosmosdb_mongo_clusters = {
#   "cosmos1" = {
#     name                         = "co-llmstudio-hc-01"
#     administrator_login          = "mongoadmin"
#     administrator_login_password = "YourSecurePassword123!" # Replace with actual password or use a Key Vault reference
#     server_version               = "7.0"
#     node_group_specs = [{
#       name         = ""
#       kind         = "Shard"
#       sku          = "M10"
#       disk_size_gb = 32
#       enable_ha    = false
#       node_count   = 1
#     }]
#     public_network_access        = "Enabled"
#     create_private_endpoint      = true
#     private_endpoint_name        = "co-llmstudio-hc-01-c-pe1"
#     subnet_name                  = "default"
#     vnet_key                     = "vnet1"
#     private_dns_zone_id          = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.Network/privateDnsZones/privatelink.mongocluster.cosmos.azure.com"
#     prevent_deployment           = true  # This is the key to prevent ARM template deployment
#   }
# }

cosmosdb_mongo_clusters = {
  "cosmos1" = {
    name                         = "co-docaistudio-hc"
    administrator_login          = "mongoadmin"
    administrator_login_password = "Ajnhf365"
    server_version               = "7.0"
    node_group_specs = [{
      name         = "docaistudio"
      kind         = "Shard"
      sku          = "M10"
      disk_size_gb = 32
      enable_ha    = false
      node_count   = 1
    }]
    public_network_access        = "Enabled"
    create_private_endpoint      = true
    private_endpoint_name        = "co-docaistudio-hc-02-c-pe"
    subnet_name                  = "default"
    vnet_key                     = "vnet1"
    # private_dns_zone_id is now optional
    prevent_deployment           = false
  }
}


#service bus configuration
# servicebus_namespaces = {
#   "servicebus1" = {
#     name           = "sb-docaistudio-hc"
#     sku            = "Standard"
#     zone_redundant = true
    
#     create_private_endpoint = false
#     private_endpoint_name   = "pe-sb-docaistudio-hc"
#     subnet_name             = "default"
#     vnet_key                = "vnet1"
    
#     topics = {
#       "tp-docaistudio-hc-egpt-agent-01" = {
#         max_size_in_megabytes = 1024
#         enable_partitioning   = false
        
#         subscriptions = {
#           "sp-docaistudio-hc-egpt-agent-01" = {
#             max_delivery_count = 100
#             lock_duration      = "PT1M"
#             auto_delete_on_idle = "P31D"
#           },
#         }
#       },
#       "tp-docaistudio-hc-egpt-ai-01" = {
#         max_size_in_megabytes = 1024
#         enable_partitioning   = false
        
#         subscriptions = {
#           "sp-docaistudio-hc-egpt-ai-01" = {
#             max_delivery_count = 100
#             lock_duration      = "PT1M"
#             auto_delete_on_idle = "P31D"
#           }
#         }
#       }
#       "tp-docaistudio-hc-egpt-backend-01" = {
#         max_size_in_megabytes = 1024
#         enable_partitioning   = false
        
#         subscriptions = {
#           "sp-docaistudio-hc-egpt-backend-01" = {
#             max_delivery_count = 100
#             lock_duration      = "PT1M"
#             auto_delete_on_idle = "P31D"
#           }
#         }
#       }
#     }
#   }
# }


servicebus_namespaces = {
  "servicebus1" = {
    name           = "sb-docaistudio-hc"
    sku            = "Standard"
    zone_redundant = true
    
    create_private_endpoint = false
    private_endpoint_name   = "pe-sb-docaistudio-hc"
    subnet_name             = "default"
    vnet_key                = "vnet1"
    
    topics = {
      "tp-docaistudio-hc-egpt-agent-01" = {
        max_size_in_megabytes = 1024            # 1 GB
        default_message_ttl   = "PT1H"          # 1 hour
        enable_partitioning   = false           # Duplicate detection: Disabled
        support_ordering      = true            # Support ordering: Enabled
        auto_delete_on_idle   = null            # Auto-delete: NEVER
        
        subscriptions = {
          "sp-docaistudio-hc-egpt-agent-01" = {
            max_delivery_count  = 100            # 100
            lock_duration       = "PT1M"         # 1 minute
            default_message_ttl = "PT10M"        # 10 minutes
            auto_delete_on_idle = "P31D"         # 31 days
            dead_lettering_on_message_expiration = false
            forward_to          = null           # Forward messages: Disabled
          },
        }
      },
      "tp-docaistudio-hc-egpt-ai-01" = {
        max_size_in_megabytes = 1024
        default_message_ttl   = "PT1H"
        enable_partitioning   = false
        support_ordering      = true
        auto_delete_on_idle   = null
        
        subscriptions = {
          "sp-docaistudio-hc-egpt-ai-01" = {
            max_delivery_count  = 100
            lock_duration       = "PT1M"
            default_message_ttl = "PT10M"
            auto_delete_on_idle = "P31D"
            dead_lettering_on_message_expiration = false
          }
        }
      },
      "tp-docaistudio-hc-egpt-backend-01" = {
        max_size_in_megabytes = 1024
        default_message_ttl   = "PT1H"
        enable_partitioning   = false
        support_ordering      = true
        auto_delete_on_idle   = null
        
        subscriptions = {
          "sp-docaistudio-hc-egpt-backend-01" = {
            max_delivery_count  = 100
            lock_duration       = "PT1M"
            default_message_ttl = "PT10M"
            auto_delete_on_idle = "P31D"
            dead_lettering_on_message_expiration = false
          }
        }
      }
    }
  }
}

# servicebus_namespaces = {
#   "servicebus1" = {
#     name           = "sb-llmstudio-hc-01"
#     sku            = "Standard"
#     zone_redundant = true
#     # If you have a private endpoint:
#     # create_private_endpoint = true
#     # private_endpoint_name = "pe-sb-llmstudio-hc-01"
#     # subnet_name = "default"
#     # vnet_key = "vnet1"
#     # private_dns_zone_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.Network/privateDnsZones/privatelink.servicebus.windows.net"
#   }
# }


#storage account configuration
storage_accounts = {
  "storage1" = {
    name                          = "sadocaistudiohc"
    account_tier                  = "Standard"
    account_replication_type      = "LRS"
    account_kind                  = "StorageV2"
    access_tier                   = "Hot"
    enable_https_traffic_only     = true
    min_tls_version               = "TLS1_2"
    shared_access_key_enabled     = true
    public_network_access_enabled = true
    large_file_share_enabled      = true
    cross_tenant_replication_enabled = false
    
    # Network configuration
    network_default_action        = "Allow"
    ip_rules                      = []
    network_bypass                = ["AzureServices"]
    
    # Private endpoint configuration
    create_private_endpoint       = true
    private_endpoint_name         = "pe-sadocaistudiohc"
    subnet_name                   = "default"
    vnet_key                      = "vnet1"
    private_endpoint_subresources = ["blob"]
    
    # Container configuration
    containers = [
      {
        name                  = "docai"
        container_access_type = "private"
      },
      {
        name                  = "egpt"
        container_access_type = "private"
      },
      {
        name                  = "rlef"
        container_access_type = "private"
        metadata = {
          "description" = "Container for log files"
        }
      }
    ]
  }
}

# storage_accounts = {
#   "storage1" = {
#     name                          = "sallmstudiohc01"
#     account_tier                  = "Standard"
#     account_replication_type      = "LRS"
#     account_kind                  = "StorageV2"
#     access_tier                   = "Hot"
#     enable_https_traffic_only     = true
#     min_tls_version               = "TLS1_2"
#     shared_access_key_enabled     = true
#     public_network_access_enabled = false
#     large_file_share_enabled      = true
#     cross_tenant_replication_enabled = false
    
#     # Network configuration
#     network_default_action        = "Deny"
#     ip_rules                      = []
#     network_bypass                = ["AzureServices"]
    
#     # Private endpoint configuration
#     create_private_endpoint       = true
#     private_endpoint_name         = "pe-sallmstudiohc01"
#     subnet_name                   = "default"
#     vnet_key                      = "vnet1"
#     private_endpoint_subresources = ["blob"]
#   }
# }

# storage_accounts = {
#   "storage1" = {
#     name                          = "sallmstudiohc01"
#     account_tier                  = "Standard"
#     account_replication_type      = "LRS"
#     account_kind                  = "StorageV2"
#     access_tier                   = "Hot"
#     enable_https_traffic_only     = true
#     min_tls_version               = "TLS1_2"
#     allow_blob_public_access      = false
#     shared_access_key_enabled     = true
#     public_network_access_enabled = true
#     large_file_share_enabled      = true
#     cross_tenant_replication_enabled = false
    
#     # Network configuration
#     network_default_action        = "Allow"
#     ip_rules                      = ["20.57.103.93"]  
#     network_bypass                = ["AzureServices"]
    
#     # Private endpoint configuration
#     create_private_endpoint       = true
#     private_endpoint_name         = "pe-sallmstudiohc01"
#     subnet_name                   = "default"
#     vnet_key                      = "vnet1"
#     private_endpoint_subresources = ["blob"]
#     private_dns_zone_ids          = [
#       "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/rg-llmstudio-hc-01/providers/Microsoft.Network/privateDnsZones/privatelink.blob.core.windows.net"
#     ]
#   }
# }

#aks configuration

# aks = {
#   "aks-llmstudio-hc-01" = {
#     name                = "aks-llmstudio-hc-02"
#     dns_prefix          = "aks-llmstudio-hc-01-dns"
#     kubernetes_version  = "1.30.10"
#     node_resource_group = "MC_rg-llmstudio-hc-01_aks-llmstudio-hc-01_eastus2"
    
#     default_node_pool = {
#       name         = "npllmstudio"
#       vm_size      = "Standard_D4ads_v6"
#       min_count    = 1
#       max_count    = 4
#       node_count   = 2
#       os_disk_size_gb = 220
#     }
    
#     vnet_key      = "vnet1"
#     subnet_name   = "default"
    
#     log_analytics_workspace_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/hc-dea-test/providers/Microsoft.OperationalInsights/workspaces/techous-d-dea-sqlmi-logworkspace"
#   }
# }

# aks = {
#   "aks-llmstudio-hc-01" = {
#     name                = "aks-llmstudio-hc-01"
#     dns_prefix          = "aks-llmstudio-hc-01-dns"
#     kubernetes_version  = "1.30.10"
#     node_resource_group = "MC_rg-llmstudio-hc-01_aks-llmstudio-hc-01_eastus2"
    
#     default_node_pool = {
#       name         = "npllmstudio"
#       vm_size      = "Standard_D4ads_v6"
#       min_count    = 1
#       max_count    = 4
#       node_count   = 2
#       os_disk_size_gb = 220
#     }
    
#     vnet_key      = "vnet1"
#     subnet_name   = "default"
    
#     log_analytics_workspace_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/hc-dea-test/providers/Microsoft.OperationalInsights/workspaces/techous-d-dea-sqlmi-logworkspace"
#   }

#   "aks-llmstudio-hc-02" = {
#     name                = "aks-llmstudio-hc-02"
#     dns_prefix          = "aks-llmstudio-hc-02-dns"
#     kubernetes_version  = "1.30.10"
#     # node_resource_group = "MC_rg-llmstudio-hc-01_aks-llmstudio-hc-01_eastus2"
    
#     default_node_pool = {
#       name         = "npllmstudio"
#       vm_size      = "Standard_D4ads_v6"
#       min_count    = 1
#       max_count    = 4
#       node_count   = 2
#       os_disk_size_gb = 220
#     }
    
#     vnet_key      = "vnet1"
#     subnet_name   = "default"
    
#     log_analytics_workspace_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/hc-dea-test/providers/Microsoft.OperationalInsights/workspaces/techous-d-dea-sqlmi-logworkspace"
#   }
# }

# aks = {
#   "aks-llmstudio-hc-01" = {
#     name                = "aks-llmstudio-hc-02"
#     dns_prefix          = "aks-llmstudio-hc-02-dns"
#     kubernetes_version  = "1.30.10"
    
#     default_node_pool = {
#       name         = "npllmstudio2"
#       vm_size      = "Standard_D4ads_v6"
#       min_count    = 1
#       max_count    = 4
#       node_count   = 2
#       os_disk_size_gb = 220
#     }
    
#     vnet_key      = "vnet1"
#     subnet_name   = "default"
    
#     # log_analytics_workspace_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/hc-dea-test/providers/Microsoft.OperationalInsights/workspaces/techous-d-dea-sqlmi-logworkspace"
#   },
#   # "aks-llmstudio-hc-02" = {
#   #   name                = "aks-llmstudio-hc-02"
#   #   dns_prefix          = "aks-llmstudio-hc-02-dns"
#   #   kubernetes_version  = "1.30.10"
    
#   #   default_node_pool = {
#   #     name         = "npllmstudio"
#   #     vm_size      = "Standard_D4ads_v6"
#   #     min_count    = 1
#   #     max_count    = 4
#   #     node_count   = 2
#   #     os_disk_size_gb = 220
#   #   }
    
#   #   vnet_key      = "vnet1"
#   #   subnet_name   = "default"
    
#   #   # log_analytics_workspace_id = "/subscriptions/e9152dfc-abea-4b1b-8d1d-a5bbb2c1832c/resourceGroups/hc-dea-test/providers/Microsoft.OperationalInsights/workspaces/techous-d-dea-sqlmi-logworkspace"
#   # },
# }

# aks = {
#   "aks-llmstudio-hc-01" = {
#     name                = "aks-llmstudio-hc-02"
#     dns_prefix          = "aks-llmstudio-hc-02-dns"
#     kubernetes_version  = "1.31.1"
#     sku_tier            = "Free"
    
#     default_node_pool = {
#       name            = "npllmstudio1"  
#       vm_size         = "Standard_B2s"
#       node_count      = 1
#       min_count       = 1
#       max_count       = 2
#       os_disk_size_gb = 30
#     }
    
#     vnet_key      = "vnet1"
#     subnet_name   = "default"

#     network_plugin     = "azure"
#     network_plugin_mode = null  # Add this line
#     # network_policy     = "azure"
    
#     # Configure to create a new Log Analytics workspace
#     use_existing_log_analytics = false
    
#     # Optional configurations
#     aci_connector_enabled = true
#     aci_connector_subnet  = "default"  
    
#     # New settings for API server and load balancer
#     api_server_access_profile = {
#       enable_private_cluster = true  # Disable public access to API server
#       authorized_ip_ranges   = []    # Disable authorized IP ranges
#     }
    
#     load_balancer_profile = {
#       sku_tier = "Standard"  # Set load balancer to Standard
#     }
    

#     tags = {
 
#     }
#   }
# }


aks = {
  "aks-docaistudio-hc" = {
    name                = "aks-docaistudio-hc"
    dns_prefix          = "aks-docaistudio-hc-dns"
    kubernetes_version  = "1.30.11"  
    sku_tier            = "Free"
    
    default_node_pool = {
      name            = "default"  
      vm_size         = "Standard_D4ads_v6"
      node_count      = 1
      min_count       = 1
      max_count       = 4
      os_disk_size_gb = 220
    }
    
    vnet_key      = "vnet1"
    subnet_name   = "default"

    # Network configuration for Azure CNI with migration option
    network_plugin     = "azure"
    network_plugin_mode = null  # Not set to enable migration option
    
    # Log Analytics configuration from screenshot 2
    use_existing_log_analytics = false
    log_analytics_workspace_name = "techous-d-dea-sqlmi-logworkspace1"
    
    # Optional configurations
    aci_connector_enabled = true
    aci_connector_subnet  = "aks"  

    #new thing
    # ACR Integration - Simple name-based approach
    attach_acr = true
    acr_name   = "crdocaistudiohc"
    # Optional: acr_resource_group_name = "rg-docaistudio-hc" (defaults to AKS resource group)
    # Optional: acr_subscription_id = "00000000-0000-0000-0000-000000000000" (defaults to AKS subscription)
    
    
    # Advanced configuration shown in screenshots
    auto_upgrade_profile = {
      upgrade_channel = "patch"
      schedule = "Sunday.23:00-Monday.5:00"
    }
    
    security_profile = {
      node_security_channel = "NodeImage"
      security_channel_schedule = "FirstSundayOfEveryMonth"
    }
    
    authentication = {
      enable_azure_rbac = true
      disable_local_accounts = true
    }
    
    tags = {
    }
  }
}



# service connector configuration
aks_cluster_name    = "aks-docaistudio-hc"

# Storage blob connections with different client types and roles
storage_blob_connections = [
  {
    name                 = "storage-connection-1"
    account              = "sadocaistudiohc"
    connection           = "storage_blob_connection1"
    workload_identity    = "az-docai"
    client_type          = "Python" # Default option
    role                 = "Storage Blob Data Contributor"
  },
#   {
#     name                 = "storage-connection-2"
#     account              = "sallmstudiohc03" 
#     connection           = "storage_blob_connection2"
#     workload_identity    = "test"
#     client_type          = ".NET"
#     role                 = "Storage Blob Data Reader"
#   },
#   {
#     name                 = "java-storage"
#     account              = "javastore"
#     connection           = "java_storage_conn"
#     workload_identity    = "java-identity"
#     client_type          = "Java"
#     role                 = "Storage Blob Data Owner"
#   },
#   {
#     name                 = "node-storage"
#     account              = "nodestore"
#     connection           = "node_storage_conn"
#     workload_identity    = "node-identity"
#     client_type          = "Node.js"
#     role                 = "Storage Queue Data Contributor"
#   }
]

# # Service bus connections with different client types and roles
# service_bus_connections = [
#   {
#     name                 = "servicebus-connection-1"
#     namespace            = "sb-docaistudio-hc"
#     connection           = "service_bus_connection1"
#     workload_identity    = "az-docai"
#     client_type          = "Python" # Default option
#     role                 = "Azure Service Bus Data Owner"
#   },
#   {
#     name                 = "dotnet-servicebus"
#     namespace            = "sb-dotnet"
#     connection           = "dotnet_sb_conn"
#     workload_identity    = "dotnet-identity"
#     client_type          = ".NET"
#     role                 = "Azure Service Bus Data Sender"
#   },
#   {
#     name                 = "java-servicebus"
#     namespace            = "sb-java"
#     connection           = "java_sb_conn"
#     workload_identity    = "java-identity"
#     client_type          = "Java"
#     role                 = "Azure Service Bus Data Receiver"
#     k8s_namespace        = "java-app"
#   }
# ]

# Key Vault connections
# keyvault_connections = [
#   {
#     name                 = "keyvault-connection-1"  #object you can say for proper sagrigation
#     vault                = "kv-docaistudio-hc" # key vault name
#     connection           = "keyvault_1bb48"
#     workload_identity    = "az-docai" # managed identity name 
#     client_type          = "Python"
#     k8s_namespace        = "default"
#     # No need to specify roles as "Key Vault Certificate User" and "Key Vault Secrets User" are assigned by default
#     enable_csi           = false
#   },
  # {
  #   name                 = "keyvault-connection-2"
  #   vault                = "kv-llmstudio-hc-02"
  #   connection           = "keyvault_csi_conn"
  #   workload_identity    = "test"  # Not used with CSI
  #   client_type          = "Python"
  #   k8s_namespace        = "default"
  #   enable_csi           = true
  # }
# ]


#managed-identity configuration
managed_identities = {
  "managed-identity" = {
    name = "az-docai"
  }
}


#openai configuration
openai_accounts = {
  "openai1" = {
    name                          = "oai-docaistudio-hc1"
    sku_name                      = "S0"
    custom_subdomain_name         = "oai-docaistudio-hc1"
    public_network_access_enabled = false
    
    # Network configuration
    network_default_action        = "Deny"
    ip_rules                      = []
    
    # Private endpoint configuration
    create_private_endpoint       = true
    private_endpoint_name         = "pe-oai-docaistudio-hc1"
    subnet_name                   = "default"
    vnet_key                      = "vnet1"
    
    # Model deployments
    model_deployments = [
      # {
      #   name           = "gpt-35-turbo"
      #   model_name     = "gpt-35-turbo"
      #   model_version  = "0301"
      #   scale_capacity = 1
      # },
      # {
      #   name           = "gpt-4"
      #   model_name     = "gpt-4"
      #   model_version  = "0613"
      #   scale_capacity = 1
      # },
      # {
      #   name           = "text-embedding-ada-002"
      #   model_name     = "text-embedding-ada-002"
      #   model_version  = "2"
      #   scale_capacity = 1
      # }
    ]
  }
}


#postgresql configuration



postgresql_servers = {
  "pgdocaistudio" = {
    name                = "pgdocaitudio04"
    location            = "centralus"
    administrator_login = "pgtechoadmin"
    administrator_password = "Ajnhhydesf365" # Replace with your secure password
    
    # Based on your JSON settings
    postgres_version = "16" # Using 15 since 16 isn't supported yet
    sku_name = "B_Standard_B1ms"
    storage_size_gb = 32
    storage_auto_grow_enabled = true
    availability_zone = "2"
    
    backup_retention_days = 7
    geo_redundant_backup = false
    
    active_directory_auth_enabled = false
    password_auth_enabled = true
    
    allow_azure_services = true

    maintenance_window_enabled = false
    
    # Example database creation
    databases = [
      {
        name = "docaistudio1"
      }
    ]
    
    # Example firewall rule to allow all connections
    firewall_rules = [
      # {
      #   name = "AllowAll"
      #   start_ip_address = "0.0.0.0"
      #   end_ip_address = "255.255.255.255"
      # },
      {
        name = "techo-hyd-wifi"
        start_ip_address = "139.167.129.22"
        end_ip_address = "139.167.129.22"
      }
    ]
    
    tags = {}
  }
}


# #synapse configuration

# # SQL Admin Credentials
# sql_admin_username = "sqladminuser"
# sql_admin_password = "YourSecurePassword123!"

# # Synapse Workspaces Configuration
# synapse_workspaces = {
#   "synapse1" = {
#     name                 = "syn-llmstudio-hc-02"
#     storage_account_name = "adlsllmstudiohc02"
    
#     # Optional Storage Configuration
#     filesystem_name                  = "donottouchsynapse1"
#     storage_account_tier             = "Standard"
#     storage_account_replication_type = "LRS"
#     storage_account_kind             = "StorageV2"
#     storage_is_hns_enabled           = true
    
#     # Network Configuration
#     public_network_access_enabled = true
#     azuread_only_authentication   = false
#     trusted_service_bypass_enabled = false
    
#     # Optional Firewall Rules
#     synapse_firewall_rules = {
#       "allowAll" = {
#         start_ip_address = "0.0.0.0"
#         end_ip_address   = "255.255.255.255"
#       }
#     }
    
#     # Additional Tags
#     tags = {
#       component = "data-analytics"
#     }
#   }
# }
