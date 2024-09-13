# gcp-policy-as-code

This repository is an example repository showcasing the power of 
HashiCorp Sentinel Policy as Code for Terraform.

## Synopsis

This repository demonstrates the beginnings of a successful Terraform Enterprise or HashiCorp Cloud Platform Policy Set that aligns with the following organizational process:

- An application team aims to either deploy a net new application to the cloud or migrate this specific application to the cloud from being an on-premise workload.

- Organizations in high compliance industries will generally need to review all cloud services to be consumed, as well as provide codified guidance on the consumption of these resources.

- The output from this review can be codified within the Sentinel policy-as-code framework in short order, allowing application teams to quickly codify their infrastructure in a simple fashion.

- As the consumption of this resource grows and propagates through many application teams, it may become apparent that a Terraform module is necessary for this resource. At this juncture, many application teams have experience deploying the resource, allowing for at least crowd-sourcing of knowledge for the creation of the Terraform module, if not crowd-sourcing of the module itself.

- Application teams can now choose whether or not to deploy this resource in a simple fashion at the root level of their Terraform workspace or use the highly opinionated module which has been created with at least months of experience guiding the module creation.

## Repository Structure

``` bash
.
├── README.md
├── ensure_allowed_root_resource_or_module.sentinel
├── google_artifact_registry_repository.sentinel
├── google_cloud_run_service.sentinel
├── google_cloudfunctions2_function.sentinel
├── sentinel.hcl
├── test
│   ├── ensure_allowed_root_resource_or_module
│   │   ├── fail.hcl
│   │   └── pass.hcl
│   ├── google_artifact_registry_repository
│   │   ├── fail.hcl
│   │   └── pass.hcl
│   ├── google_cloud_run_service
│   │   ├── fail.hcl
│   │   └── pass.hcl
│   └── google_cloudfunctions2_function
│       ├── fail.hcl
│       └── pass.hcl
└── testdata
    ├── mock-ensure-allowed-root-resource-or-module-fail.mock
    ├── mock-ensure-allowed-root-resource-or-module-pass.mock
    ├── mock-google-artifact-registry-repository-fail.mock
    ├── mock-google-artifact-registry-repository-pass.mock
    ├── mock-google-cloud-run-service-fail.mock
    ├── mock-google-cloud-run-service-pass.mock
    ├── mock-google-cloudfunctions2-function-fail.mock
    └── mock-google-cloudfunctions2-function-pass.mock
```

This repository is organized in a specific way to allow for ease of testing the Sentinel policies that are included within and readability/ ease of understanding the policies.

Running `sentinel test` at the root of this repository will execute the tests defined in the `*.hcl` Sentinel files within the `test/<policyname>` directories.

The policies themselves are at the root of the repository along with with a Sentinel HCL file which configures the policies within the Policy Sets within Terraform Enterprise (TFE) or HashiCorp Cloud Platform Terraform (HCPTF).

There is also the `.github/` directory which contains a quick example of how to use GitHub Actions CI/CD in conjunction with Sentinel to ensure proper execution of tests as you build out additional Sentinel policies.

## Workflow

1. Write root module level Terraform code which represents the resource you'd like to write a Sentinel policy for. Include all supporting resources necessary to deploy the resource in a manner which is aligned with your organization's security policies.

1. Using either TFE or HCPTF, apply the Terraform configuration that you've written in step 1.

1. Navigate to the workspace that holds the Terraform config from step 1 and navigate to the run associated with the apply executed from step 2. Once on the UI page for the run, expand the "Plan" phase and click on the button at the bottom left to download the Sentinel mock files.

    - Note: When you download the Sentinel mock files, they will be in a zipped  directory. When unpacked, The file extension for each of these files will be `.sentinel` which can conflict with the recursive nature of the Sentinel GitHub Action when running the `fmt` functionality of the action with `.` as the `working_dir`. The file extensions for your sentinel mocks should be changed to something that is not `.sentinel`.

1. Modify your mock files to represent both "pass" and "fail" scenarios and organize them into the `test/testdata` directory.

1. Begin writing your Sentinel policy, addressing the specific security constraints set forth by your organization's security policies for that cloud resource.

1. Excessive use of `sentinel test -verbose` will help you evaluate the policies as you build them.

1. Be sure to add the name of the resource to the policy that ensures either the resource has a Sentinel policy defined or that the resource is being consumed via a Terraform module.