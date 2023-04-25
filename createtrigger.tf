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
