# squaaat-infra

terraform code about squaaat cloud infrastructure

# Requirements

- `direnv` cli
- `tfenv` (using terraform 0.14.3)
- AWS access, secret key. Plz, refer to `.envrc.example`

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