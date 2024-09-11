policy "google_artifact_registry_repository" {
    source = "./google_artifact_registry_repository.sentinel"
    enforcement_level = "hard-mandatory"
}

policy "google_cloud_run_service" {
  source = "./google_cloud_run_service.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "google_cloundfunctions2_function" {
  source = "./google_cloudfunctions2_function.sentinel"
  enforcement_level = "hard-mandatory"
}