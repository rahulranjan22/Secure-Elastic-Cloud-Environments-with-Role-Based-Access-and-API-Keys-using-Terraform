resource "ec_deployment" "elasticsearch" {
  name                   = "Onboarding"
  region                 = "gcp-us-central1"
  version                = "8.17.3"
  deployment_template_id = "gcp-storage-optimized"

  elasticsearch = {
    hot = {
      size        = "4g"
      zone_count  = 1
      autoscaling = {}
    }

    warm = {
      size        = "2g"
      zone_count  = 1
      autoscaling = {}
    }
  }

  kibana = {
    size       = "1g"
    zone_count = 1
  }

  enterprise_search = {
    size       = "2g"
    zone_count = 1
  }
}
