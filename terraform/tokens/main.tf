# consul_acl_token.ID-00000000-0000-0000-0000-000000000002:
resource "consul_acl_token" "ID-00000000-0000-0000-0000-000000000002" {
    description = "Anonymous Token"
    local       = false
    policies    = []
    roles       = []
}
# consul_acl_token.ID-05c22cf4-f9ff-5ea6-02d8-8e7eccca4ed2:
resource "consul_acl_token" "ID-05c22cf4-f9ff-5ea6-02d8-8e7eccca4ed2" {
    description = "CONSUL_COUNTING_TOKEN"
    local       = false
    policies    = [
        "counting_service_policy",
        "global-management",
    ]
    roles       = []
}
# consul_acl_token.ID-67c75981-9723-40dd-f58b-0bb60e133576:
resource "consul_acl_token" "ID-67c75981-9723-40dd-f58b-0bb60e133576" {
    description = "CONSUL_INGRESS_TOKEN"
    local       = false
    policies    = [
        "ingress_policy",
    ]
    roles       = []
}
# consul_acl_token.ID-7a1d13f6-dd78-4afa-e641-8d91b1a82d00:
resource "consul_acl_token" "ID-7a1d13f6-dd78-4afa-e641-8d91b1a82d00" {
    description = "CONSUL_REPLICATION_TOKEN"
    local       = false
    policies    = [
        "replication-policy",
    ]
    roles       = []
}
# consul_acl_token.ID-7c27a2a3-32e3-ebc9-b07d-76e48855d25f:
resource "consul_acl_token" "ID-7c27a2a3-32e3-ebc9-b07d-76e48855d25f" {
    description = "CONSUL_AGENT_TOKEN"
    local       = false
    policies    = [
        "agent-policy",
    ]
    roles       = []
}
# consul_acl_token.ID-9f7dfeda-5cb0-4def-d7c1-a754ffed6556:
resource "consul_acl_token" "ID-9f7dfeda-5cb0-4def-d7c1-a754ffed6556" {
    description = "Token for DNS Requests"
    local       = false
    policies    = []
    roles       = []
}
# consul_acl_token.ID-c248a073-9113-6198-fb15-b26b8d8af247:
resource "consul_acl_token" "ID-c248a073-9113-6198-fb15-b26b8d8af247" {
    description = "CONSUL_MESH_TOKEN"
    local       = false
    policies    = [
        "mesh_gateway",
    ]
    roles       = []
}
# consul_acl_token.ID-c3fdaaa3-9a66-f9f2-8860-dc8b5a108cda:
resource "consul_acl_token" "ID-c3fdaaa3-9a66-f9f2-8860-dc8b5a108cda" {
    description = "CONSUL_DASH_TOKEN"
    local       = false
    policies    = [
        "dash_board_agent",
    ]
    roles       = []
}
# consul_acl_token.ID-f0e64ee6-483a-eed5-f727-2f3afb54c853:
resource "consul_acl_token" "ID-f0e64ee6-483a-eed5-f727-2f3afb54c853" {
    description = "Bootstrap Token (Global Management)"
    local       = false
    policies    = [
        "global-management",
    ]
    roles       = []
}
# consul_acl_token.ID-f267ac88-2dca-37a7-662b-144e461785c8:
resource "consul_acl_token" "ID-f267ac88-2dca-37a7-662b-144e461785c8" {
    description = "snapshot"
    local       = false
    policies    = [
        "snapshot_agent",
    ]
    roles       = []
}
