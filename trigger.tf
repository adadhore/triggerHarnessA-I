resource "azurerm_function_app" "b59func" {
  # Deploy conditionally based on Feature Flag variable
  count = local.deploy_b59func == true ? 1 : 0

provider "http" {}

resource "null_resource" "trigger_webhook" {
  triggers = {
    payload = jsonencode({
      sample_key = "sample_value"
    })
  }

  provisioner "local-exec" {
    command = <<-EOT
      curl -X POST \
        -H "content-type: application/json" \
        -H "X-Api-Key: sample_api_key" \
        --url https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=ROodF2xySYuWhp1rNwZuRw&orgIdentifier=default&projectIdentifier=testing&pipelineIdentifier=testpipeline&triggerIdentifier=Webhook" \
        -d '${jsonencode({
          sample_key = "sample_value"
        })}'
    EOT
  }
}

# Variables
#variable "api_key" {}
#variable "account_id" {}
#variable "org_id" {}
#variable "project_id" {}
#variable "pipeline_id" {}
#variable "trigger_id" {}
  
}

*************
  
curl -X POST -H 'content-type: application/json' -H 'X-Api-Key: sample_api_key' --url 'https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=ROodF2xySYuWhp1rNwZuRw&orgIdentifier=default&projectIdentifier=testing&pipelineIdentifier=testpipeline&triggerIdentifier=Webhook' -d '{"sample_key": "sample_value"}'


*************
  
curl.exe -X POST -H 'content-type: application/json' -H 'X-Api-Key: pat.ROodF2xySYuWhp1rNwZuRw.64466d41ca3ee013a381a878.KiA1UfW1IRTdlEcSuZOD' --url 'https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=ROodF2xySYuWhp1rNwZuRw&orgIdentifier=default&projectIdentifier=testing&pipelineIdentifier=testpipeline&triggerIdentifier=Webhook' -d '{"sample_key": "sample_value"}'




*************
  


resource "null_resource" "trigger_webhook" {
  triggers = {
    payload = jsonencode({
      sample_key = "sample_value"
    })
  }

  provisioner "local-exec" {
    command = <<EOT
      curl -X POST -H 'content-type: application/json' -H 'X-Api-Key: pat.ROodF2xySYuWhp1rNwZuRw.64466d41ca3ee013a381a878.KiA1UfW1IRTdlEcSuZOD' --url 'https://app.harness.io/gateway/pipeline/api/webhook/custom/v2?accountIdentifier=ROodF2xySYuWhp1rNwZuRw&orgIdentifier=default&projectIdentifier=testing&pipelineIdentifier=testpipeline&triggerIdentifier=Webhook' -d '{"sample_key": "sample_value"}'
    EOT
  }
}

