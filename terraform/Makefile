.PHONY: init plan apply destroy fmt validate clean

# Terraform初期化
init:
	terraform init

# 実行計画を表示
plan:
	terraform plan

# 変更を適用
apply:
	terraform apply

# 変更を自動承認で適用
apply-auto:
	terraform apply -auto-approve

# リソースを削除
destroy:
	terraform destroy

# コードをフォーマット
fmt:
	terraform fmt -recursive

# 構文を検証
validate:
	terraform validate

# フォーマット + 検証
check: fmt validate

# 状態を確認
state:
	terraform state list

# 出力を表示
output:
	terraform output

# ローカルファイルをクリーンアップ
clean:
	rm -rf .terraform
	rm -f .terraform.lock.hcl
	rm -f terraform.tfstate*

# 初期化からapplyまで一括実行
all: init apply



