package terraform.policies.google_artifact_registry_repository

import rego.v1

resources := [resource_change |
	some resource_change in input.plan.resource_changes
	resource_change.type == "google_artifact_registry_repository"
	resource_change.change.actions in [["no-op"], ["create"], ["update"]]
]

check_cmek_null[msg] if {
	some resource in resources
	resource.change.after.kms_key_name == null
	msg := [sprintf("Resource %s needs to have CMEK provided.", [resource.address])]
}

check_cmek_empty_string[msg] if {
	some resource in resources
	resource.change.after.kms_key_name == ""
	msg := [sprintf("Resource %s needs to have CMEK provided.", [resource.address])]
}

check_format[msg] if {
	some resource in resources
	not resource.change.after.format == "DOCKER"
	msg := [sprintf("Resource %s can only be a Docker repository.", [resource.address])]
}
