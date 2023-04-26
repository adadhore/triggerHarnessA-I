terraform {
  required_providers {
    harness = {
      source = "harness/harness"
    }
  }
}

provider "harness" {
  api_key     = var.api_key
  account_id  = 
}

resource "harness_platform_triggers" "trigger" {
  identifier = CD-QA-EKS-Config
  org_id     = 
  project_id = testBBS
  name       = CD-QA-EKS-Config
  target_id  = CD-QA-EKS-Config
  yaml       = <<-EOT
    trigger:
      name: CD-QA-EKS-Config
      identifier: CD-QA-EKS-Config
      enabled: true
      orgIdentifier: 
      projectIdentifier: testBBS
      pipelineIdentifier: CD-QA-EKS-Config
      source:
        type: Webhook
        spec:
          type: Custom
      inputYaml: |
        pipeline: {}
  EOT
}
