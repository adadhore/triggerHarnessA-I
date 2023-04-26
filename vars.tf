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



variable "technology_area" {
    description = "The UAL Technology area"
  }

  variable "app_ci" {
    description = "The UAL APP CI"
  }
