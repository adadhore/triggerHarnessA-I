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


  variable "api_key" {
    description = "The API key for the Harness.io API."
    default     = "pat.ROodF2xySYuWhp1rNwZuRw.64466d41ca3ee013a381a878.KiA1UfW1IRTdlEcSuZOD"
  }
  
  variable "account_id" {
    description = "The account identifier for the Harness.io account."
    default     = "ROodF2xySYuWhp1rNwZuRw"
  }
  
  variable "project_id" {
    description = "The project identifier for the Harness.io project."
    default     = "testing"
  }
  
  variable "org_id" {
    description = "The organization identifier for the Harness.io organization."
    default     = "default"
  }
  
  variable "pipeline_id" {
    description = "The pipeline identifier for the Harness.io pipeline."
    default     = "testpipeline"
  }
  
  variable "trigger_id" {
    description = "The trigger identifier for the Harness.io trigger."
    default     = "Webhook2"
  }
  
  variable "sample_key" {
    description = "The sample key to include in the webhook payload."
    default     = "sample_value"
  }
  
  variable "HARNESS_ACCOUNT_ID" {
    default     = "ROodF2xySYuWhp1rNwZuRw"
  }
  
  resource "harness_platform_triggers" "example" {
    identifier = "identifier"
    org_id     = var.org_id
    project_id = var.project_id
    name       = var.trigger_id
    target_id  = var.pipeline_id
    yaml       = <<-EOT
      trigger:
        name: ${var.trigger_id}
        identifier: Webhook
        enabled: true
        orgIdentifier: ${var.org_id}
        projectIdentifier: ${var.project_id}
        pipelineIdentifier: ${var.pipeline_id}
        source:
          type: Webhook
          spec:
            type: Custom
        inputYaml: |
          pipeline: {}
    EOT
  }
  
  resource "null_resource" "trigger_webhook" {
    triggers = {
      payload = jsonencode({
        sample_key = var.sample_key
      })
    }
  
    provisioner "local-exec" {
      command = <<-EOT
        curl -X POST \
          -H "content-type: application/json" \
          -H "X-Api-Key: ${var.api_key}" \
          --url "https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=${var.account_id}&orgIdentifier=${var.org_id}&projectIdentifier=${var.project_id}&pipelineIdentifier=${var.pipeline_id}&triggerIdentifier=${var.trigger_id}" \
          -d '${jsonencode({
            sample_key = var.sample_key
          })}'
      EOT
    }
  }
  
