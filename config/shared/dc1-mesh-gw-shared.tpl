{
  "acl": {
    "tokens": {
     "default": "{{ key "CONSUL_MESH_TOKEN" }}"
    },
    "enabled": true,
    "default_policy": "deny",
    "down_policy": "extend-cache",
    "enable_token_persistence": true
  },
  "data_dir": "/data/",
  "datacenter": "dc1",
  "server": false,
  "start_join": ["10.10.0.2", "10.10.0.3", "10.10.0.4"],
  "ui": true,
  "bind_addr": "0.0.0.0",
  "ports": {
      "dns": 53,
      "grpc": 8502
  },
  "dns_config": {
    "service_ttl": {
      "*": "10s"
    },
    "node_ttl": "10s"
  },
  "client_addr": "0.0.0.0"
}