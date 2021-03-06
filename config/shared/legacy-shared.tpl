{
  "acl_agent_token": "{{ key "CONSUL_AGENT_TOKEN" }}",
  "acl_replication_token": "{{ key "CONSUL_REPLICATION_TOKEN" }}",
  "bootstrap_expect": 3,
  "bind_addr": "0.0.0.0",
  "client_addr": "0.0.0.0",
  "data_dir": "/data/",
  "log_level": "DEBUG",
  "server": true,
  "acl": {
    "enabled": true,
    "default_policy": "deny",
    "down_policy": "extend-cache",
    "enable_token_persistence": true
  },
  "primary_datacenter": "dc1",
  "acl": {
    "enabled": true,
    "default_policy": "deny",
    "down_policy": "extend-cache",
    "enable_token_persistence": true,
    "enable_token_replication": true
  },
  "ui": true,
  "ports": {
      "dns": 53
  },
  "dns_config": {
    "service_ttl": {
      "*": "10s"
    },
    "node_ttl": "10s"
  },
  "connect": {
    "enabled": true
  },
  "retry_join_wan": [
    "192.168.5.2",
    "192.168.5.3",
    "192.168.5.4",
    "192.168.5.5",
    "192.168.5.6",
    "192.168.5.7"
  ]
}
