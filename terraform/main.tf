resource "consul_acl_token" "CONSUL_COUNTING_TOKEN" {
  description = "CONSUL_COUNTING_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.counting_service_policy.name,
    "global-management",
  ]
  roles = []
}
resource "consul_acl_token" "CONSUL_INGRESS_TOKEN" {
  description = "CONSUL_INGRESS_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.ingress_policy.name,
  ]
  roles = []
}
resource "consul_acl_token" "CONSUL_REPLICATION_TOKEN" {
  description = "CONSUL_REPLICATION_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.replication-policy.name,
  ]
  roles = []
}

resource "consul_acl_token" "CONSUL_AGENT_TOKEN" {
  description = "CONSUL_AGENT_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.agent-policy.name,
  ]
  roles = []
}

resource "consul_acl_token" "CONSUL_MESH_TOKEN" {
  description = "CONSUL_MESH_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.mesh_gateway.name,
  ]
  roles = []
}

resource "consul_acl_token" "CONSUL_DASH_TOKEN" {
  description = "CONSUL_DASH_TOKEN"
  local       = false
  policies = [
    consul_acl_policy.dashboard_agent.name,
  ]
  roles = []
}

resource "consul_acl_policy" "dashboard_agent" {
  datacenters = []
  name        = "dashboard_agent"
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

resource "consul_intention" "any-any" {
	source_name = "*"
	destination_name = "*"
	action = "allow"
}

resource "consul_config_entry" "mesh_gateway" {
	kind = "proxy-defaults"
	name = "global"
	config_json = jsonencode({
		MeshGateway = {
			Mode = "local"
		}
	})

}

resource "consul_config_entry" "ingress_gateway" {
	kind = "ingress-gateway"
	name = "ingress-service"
	config_json = jsonencode({
		Listeners = [{
			Port = 8080
			Protocol = "tcp"
			Services = [{ Name = "dashboard" }]
		}]
	})

}
