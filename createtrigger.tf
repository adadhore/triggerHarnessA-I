data "harness_platform_organization" "this" {
  identifier = replace("${var.technology_area}", "-", "")
}

data "harness_platform_project" "this" {
  identifier = replace("${var.app_ci}", "-", "")
}
# Get PipelineID
data "harness_platform_pipeline" "this" {
  identifier = "identifier"
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
}
project_id = data.harness_platform_project.this.id
pipeline_id = data.harness_platform_pipeline.this.id
pipelineidentifier = data.harness_platform_pipeline.this.id
target_id = data.harness_platform_pipeline.this.id
name = data.harness_platform_pipeline.this.id



resource "harness_platform_triggers" "trigger" {
  identifier = data.harness_platform_pipeline.this.id
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
  name       = data.harness_platform_pipeline.this.id
  target_id  = data.harness_platform_pipeline.this.id
  yaml       = <<-EOT
    trigger:
      name: ${data.harness_platform_pipeline.this.id}
      identifier: ${data.harness_platform_pipeline.this.id}
      enabled: true
      orgIdentifier: ${data.harness_platform_organization.this.id}
      projectIdentifier: ${data.harness_platform_project.this.id}
      pipelineIdentifier: ${data.harness_platform_pipeline.this.id}
      source:
        type: Webhook
        spec:
          type: Custom
      inputYaml: |
        pipeline: {}
  EOT
}
