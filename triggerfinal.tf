variable "api_key" {
  description = "The API key for the Harness.io API."
}

variable "account_identifier" {
  description = "The account identifier for the Harness.io account."
}

variable "org_identifier" {
  description = "The organization identifier for the Harness.io organization."
}

variable "project_identifier" {
  description = "The project identifier for the Harness.io project."
}

variable "pipeline_identifier" {
  description = "The pipeline identifier for the Harness.io pipeline."
}

variable "trigger_identifier" {
  description = "The trigger identifier for the Harness.io trigger."
}

variable "sample_key" {
  description = "The sample key to include in the webhook payload."
  default = "sample_value"
}

module "multi-stage-pipeline" {
  // Configuration for the multi-stage-pipeline module
}

resource "null_resource" "trigger_webhook" {
  depends_on = [module.multi-stage-pipeline]

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
        --url "https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=${var.account_identifier}&orgIdentifier=${var.org_identifier}&projectIdentifier=${var.project_identifier}&pipelineIdentifier=${var.pipeline_identifier}&triggerIdentifier=${var.trigger_identifier}" \
        -d '${jsonencode({
          sample_key = var.sample_key
        })}'
    EOT
  }
}
