.PHONY: check-vars clean init plan apply destroy output

check-vars-env:
ifndef environment
	$(error environment is undefined)
endif

check-vars-backend: check-vars-env
ifndef project
	$(error project is undefined)
endif

clean: check-vars
	rm -rf .terraform

init: check-vars-backend
	terraform init -backend-config="bucket=${project}-${environment}-state" -backend-config="dynamodb_table=${project}-${environment}-state-lock"
	terraform workspace select ${environment} || terraform workspace new ${environment}

plan: check-vars-env
	terraform plan -var-file=./vars/${environment}.tfvars

apply: check-vars-env
	terraform apply -var-file=./vars/${environment}.tfvars

destroy: check-vars-env
	terraform destroy -var-file=./vars/${environment}.tfvars

output: check-vars-env
	terraform output -var-file=./vars/${environment}.tfvars
