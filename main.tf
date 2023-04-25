terraform {
    required_providers {
      harness = {
        source = "harness/harness"
      }
    }
  }

  provider "harness" {
    api_key     = var.api_key
    account_id  = var.account_id
  }
