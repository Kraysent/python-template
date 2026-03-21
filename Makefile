DEV_PROJECT_DIR := .dev-project
DEV_PROJECT_SENTINEL := $(DEV_PROJECT_DIR)/.generated-by-make-dev-project

.PHONY: dev-project
dev-project:
	@rm -rf "$(DEV_PROJECT_DIR)"
	@mkdir -p "$(DEV_PROJECT_DIR)"
	@copier copy . "$(DEV_PROJECT_DIR)" --data project_name=dev-project --answers-file "$(DEV_PROJECT_DIR)/.template.yaml" --trust
	@touch "$(DEV_PROJECT_SENTINEL)"
	@echo "Generated dev project in $(DEV_PROJECT_DIR)"
