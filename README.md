Create AWS infrastructure via Terraform

## Prerequisites

### Variable to supply runtime
1. `database_master_password`
2. `redis_auth_token`

## TF State
Since the codebase creates the state bucket but uses the state bucket to store state.
We need to migrate the state to the provisioned storage backend.

### Steps
1. Ignore/comment out the `backend.tf`
2. Apply your TF
3. Enable `backend.tf`
4. Migrate: `terraform init` -> migrate state? -> Yes

## Execute
examples:
```
make init environment=dev project=raygill-test
make plan environment=dev
make apply environment=dev
```
