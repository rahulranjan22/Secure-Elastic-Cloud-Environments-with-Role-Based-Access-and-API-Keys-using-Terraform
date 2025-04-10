terraform {
  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "~> 0.12.2"
    }
    elasticstack = {
      source  = "elastic/elasticstack"
      version = "~> 0.11.4"
    }
  }
}

provider "ec" {
  apikey = var.elastic_api_key
}

provider "elasticstack" {
  elasticsearch {
    username  = "elastic"
    password  = var.elasticsearch_password
    endpoints = [ec_deployment.elasticsearch.elasticsearch.https_endpoint]
  }
}
