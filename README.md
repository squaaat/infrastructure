# squaaat-infra

terraform code about squaaat cloud infrastructure

# Requirements

- `tfenv` (using terraform 0.12.24)
- AWS access, secret key. Plz, refer to `.envrc.example`
- `direnv` cli

# getting start

```
$ cd ${PROJECT_PATH}
$ cp .envrc.example .envrc
$ vi .envrc # modify .envrc
$ direnv allow
$ terraform init
$ terraform plan
# check the descriptions of terraform plan
$ terraform apply
# Do yes or No
```