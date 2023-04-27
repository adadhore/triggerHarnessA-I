data "harness_platform_organization" "this" {
  identifier = replace("${var.technology_area}", "-", "")
}

data "harness_platform_project" "this" {
  identifier = replace("${var.app_ci}", "-", "")
}
data "harness_platform_pipeline" "example" {
  identifier = "identifier"
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
}

# Get Project ID
data "harness_platform_project" "this" {
  identifier = "identifier"
  org_id     = data.harness_platform_organization.this.id
}

project_id = data.harness_platform_project.this.id

# Get PipelineID ID
data "harness_platform_pipeline" "example" {
  identifier = "identifier"
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
}

pipeline_id = data.harness_platform_pipeline.this.id
pipelineidentifier = data.harness_platform_pipeline.this.id
target_id = data.harness_platform_pipeline.this.id
name = data.harness_platform_pipeline.this.id



resource "harness_platform_triggers" "trigger" {
  identifier = module.multi-stage-pipelines.pipeline_name
  org_id     = data.harness_platform_organization.this.id
  project_id = data.harness_platform_project.this.id
  name       = module.multi-stage-pipelines.pipeline_name
  target_id  = module.multi-stage-pipelines.pipeline_name
  yaml       = <<-EOT
    trigger:
      name: ${module.multi-stage-pipelines.pipeline_name}
      identifier: ${module.multi-stage-pipelines.pipeline_name}
      enabled: true
      orgIdentifier: ${data.harness_platform_organization.this.id}
      projectIdentifier: ${data.harness_platform_project.this.id}
      pipelineIdentifier: ${module.multi-stage-pipelines.pipeline_name}
      source:
        type: Webhook
        spec:
          type: Custom
      inputYaml: |
        pipeline: {}
  EOT
}

    
    output "webhook_url" {
  value = "${harness_platform_triggers.trigger.url}"
}
