policy "gcp_artifact_registry_cmek_null" {
    query = "data.terraform.policies.google_artifact_registry_repository.check_cmek_null"
    enforcement_level = "mandatory"
    description = "Check for null CMEK value"
}

policy "gcp_artifact_registry_cmek_empty_string" {
    query = "data.terraform.policies.google_artifact_registry_repository.check_cmek_empty_string"
    enforcement_level = "mandatory"
    description = "Check for empty CMEK name string"
}

policy "gcp_artifact_registry_format" {
    query = "data.terraform.policies.google_artifact_registry_repository.check_format"
    enforcement_level = "mandatory"
    description = "Check that registry is of type \"DOCKER\""
}