resource "consul_acl_policy" "dash_board_agent" {
    datacenters = []
    name        = "dash_board_agent"
    rules       = <<-EOT
        node_prefix "" {
          policy = "write"
          }
        
        service_prefix "" {
          policy = "write"
          }
        
    EOT
}

resource "consul_acl_policy" "replication-policy" {
    datacenters = []
    name        = "replication-policy"
    rules       = <<-EOT
        
        
        operator = "write"
        
        service_prefix "" {
          policy = "read"
          intentions = "read"
        }
        
        node_prefix "" {
           policy = "write"
        }
        
        namespace_prefix "" {
          acl = "write"
          service_prefix "" {
            policy = "read"
          }
        }
    EOT
}
resource "consul_acl_policy" "node_policy" {
    datacenters = []
    name        = "node_policy"
    rules       = <<-EOT
        node_prefix "" {
          policy = "write"
        }
        
        key_prefix "" {
          policy = "write"
          }
        
        operator = "write"
        
        service_prefix "" {
          policy = "write"
          intentions = "write"
        }
        
        session_prefix "" {
          policy = "write"
        }
        
        namespace_prefix "" {
          acl = "write"
          service_prefix "" {
            policy = "read"
          }
        }
        
        agent_prefix "" {
           policy = "read"
        }
    EOT
}
resource "consul_acl_policy" "snapshot_agent" {
    datacenters = []
    name        = "snapshot_agent"
    rules       = <<-EOT
        
        key_prefix "" {
           policy = "write"
          }
        session_prefix "" {
           policy = "write"
          }
        service_prefix "" {
           policy = "write"
          }
        
        node_prefix "" {
          policy = "write"
        }
        
        acl = "write"
        
        operator = "write"
        
        
    EOT
}
resource "consul_acl_policy" "agent-policy" {
    datacenters = []
    name        = "agent-policy"
    rules       = <<-EOT
        node_prefix "" {
           policy = "write"
        }
        
        service_prefix "" {
           policy = "write"
        }
        
        
        
    EOT
}
resource "consul_acl_policy" "mesh_gateway" {
    datacenters = []
    name        = "mesh_gateway"
    rules       = <<-EOT
        service_prefix "mesh" {
           policy = "write"
        }
        
        service_prefix "" {
           policy = "read"
        }

        node_prefix "" {
           policy = "write"
        }
        
        agent_prefix "" {
           policy = "read"
        }
    EOT
}
resource "consul_acl_policy" "ingress_policy" {
    datacenters = []
    name        = "ingress_policy"
    rules       = <<-EOT
        
acl = "write"
agent_prefix "" {
	policy = "write"
}
event_prefix "" {
	policy = "write"
}
key_prefix "" {
	policy = "write"
}
keyring = "write"
node_prefix "" {
	policy = "write"
}
operator = "write"
query_prefix "" {
	policy = "write"
}
service_prefix "" {
	policy = "write"
	intentions = "write"
}
session_prefix "" {
	policy = "write"
}
namespace_prefix "" {
	acl = "write"
	key_prefix "" {
		policy = "write"
	}
	node_prefix "" {
		# node policy is restricted to read within a namespace
		policy = "read"
	}
	session_prefix "" {
		policy = "write"
	}
	service_prefix "" {
		policy = "write"
		intentions = "write"
	}
}
          
    EOT
}

resource "consul_acl_policy" "counting_service_policy" {
    datacenters = []
    name        = "counting_service_policy"
    rules       = <<-EOT
        node_prefix "" {
          policy = "read"
          }
        
        service_prefix "" {
          policy = "write"
          }
    EOT
}
