 resource "null_resource" "trigger_webhook" {
  // depends_on = [module.multi-stage-pipeline]

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
  
