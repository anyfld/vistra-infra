.PHONY: help dockerfile-lint kics all-status-check ci

help:
	@echo 'Usage: make [target]'
	@echo ''
	@echo 'Available targets:'
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  %-20s %s\n", $$1, $$2}' $(MAKEFILE_LIST)

dockerfile-lint:
	@echo "Running hadolint..."
	@if command -v hadolint >/dev/null 2>&1; then \
		hadolint Dockerfile; \
	else \
		echo "Error: hadolint is not installed. Install it with: brew install hadolint (macOS) or see https://github.com/hadolint/hadolint"; \
		exit 1; \
	fi

kics:
	@echo "Running KICS..."
	@docker run --rm -v "$(PWD):/path" -w /path checkmarx/kics:latest scan -p /path

all-status-check: dockerfile-lint kics
	@echo "All status checks passed"

ci: all-status-check
