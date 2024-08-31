policy "evaluate_google_artifact_registry_repository" {
    query = "data.terraform.policies.google_artifact_registry_repository.rule"
    enforcement_level = "mandatory"
    description = "Evaluates the Google Artifact Registry Repository Resource."
}