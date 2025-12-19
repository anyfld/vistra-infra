.PHONY: init plan apply destroy fmt validate clean

init:
	terraform init

plan:
	terraform plan

apply:
	terraform apply

apply-auto:
	terraform apply -auto-approve

destroy:
	terraform destroy

fmt:
	terraform fmt -recursive

validate:
	terraform validate

check: fmt validate

state:
	terraform state list

output:
	terraform output

clean:
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate*

all: init apply



