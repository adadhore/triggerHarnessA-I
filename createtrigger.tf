data "harness_platform_organization" "this" {
  identifier = replace("${var.technology_area}", "-", "")
}

data "harness_platform_project" "this" {
  identifier = replace("${var.app_ci}", "-", "")
}

resource "harness_platform_triggers" "trigger" {
  identifier = module.multi-stage-pipelines.pipeline_name
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
  name       = module.multi-stage-pipelines.pipeline_name
  target_id  = var.pipeline_id
  yaml       = <<-EOT
    trigger:
      name: module.multi-stage-pipelines.pipeline_name
      identifier: module.multi-stage-pipelines.pipeline_name
      enabled: true
      orgIdentifier: data.harness_platform_organization.this.id
      projectIdentifier: data.harness_platform_project.this.id
      pipelineIdentifier: ${var.pipeline_id}
      source:
        type: Webhook
        spec:
          type: Custom
      inputYaml: |
        pipeline: {}
  EOT
}
