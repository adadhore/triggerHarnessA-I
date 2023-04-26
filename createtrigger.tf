 resource "harness_platform_triggers" "example" {
    identifier = ${var.pipeline_name}
    org_id     = var.org_id
    project_id = var.project_id
    name       = var.pipeline_name
    target_id  = var.pipeline_id
    yaml       = <<-EOT
      trigger:
        name: ${var.pipeline_name}
        identifier: ${var.pipeline_name}
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
