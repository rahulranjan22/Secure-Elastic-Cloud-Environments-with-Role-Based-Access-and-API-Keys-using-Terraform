resource "elasticstack_elasticsearch_security_role" "custom_monitoring_role" {
  name = "custom_monitoring_role"

  cluster = ["monitor"]

  indices {
    names      = ["filebeat-*", "metricbeat-*"]
    privileges = ["read", "view_index_metadata"]
  }
}

resource "elasticstack_elasticsearch_security_api_key" "api_key" {
  depends_on = [
    ec_deployment.elasticsearch,
    elasticstack_elasticsearch_security_role.custom_monitoring_role
  ]

  name = "terraform-api-key"

  role_descriptors = jsonencode({
    "custom_monitoring_role" = {
      cluster = ["monitor"]
      index = [{
        names      = ["filebeat-*", "metricbeat-*"]
        privileges = ["read", "view_index_metadata"]
      }]
    }
  })
}
