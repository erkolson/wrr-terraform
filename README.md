# We Are Rosie Terraform

### Project creation

The admin folder scope is where all folders and projects should be created.

### Remote State

All terraform state should be stored in the `wrr-cicd-tf-state` bucket in the
`wrr-cicd-main` project.  State prefixes should follow org folder/project
structures.  For example the following folder and project terraform scopes:

```
org
├── admin
├── cicd
│   └── wrr-cicd-main
└── vpn
    └── wrr-vpn
```
Should use the following prefixes
```
terraform-state/admin/
terraform-state/cicd/wrr-cicd-main
terraform-state/vpn/wrr-vpn
```
