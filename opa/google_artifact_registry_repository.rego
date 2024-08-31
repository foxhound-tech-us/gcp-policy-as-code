package terraform.policies.google_artifact_registry_repository

import future.keywords.in

actions := [
	["no-op"],
	["create"],
	["update"],
]

resources := [resource_changes |
	resource_changes := input.plan.resource_changes[_]
	resource_changes.type == "google_artifact_registry_repository"
	resource_changes.change.actions in actions
]

check_cmek_not_null := [msg |
	resource := resources[_]
	resource.change.after.kms_key_name == null
	msg := sprintf("Resource %s needs to have CMEK provided.", [resource.address])
]

check_cmek_not_empty_string := [msg |
	resource := resources[_]
	resource.change.after.kms_key_name == ""
	msg := sprintf("Resource %s needs to have CMEK provided.", [resource.address])
]

check_format := [msg |
	resource := resources[_]
	not resource.change.after.format == "DOCKER"
	msg := sprintf("Resource %s can only be a Docker repository.", [resource.address])
]

x := array.concat(check_cmek_not_null, check_cmek_not_empty_string)
violations := array.concat(x, check_format)

rule[msg] {
	count(violations) != 0
	msg := violations
}
