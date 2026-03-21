DEV_PROJECT_DIR := .dev-project
DEV_PROJECT_COMPARE_DIR := .dev-project.compare

dev:
	@if [ -d "$(DEV_PROJECT_DIR)" ]; then \
		read -r -p "$(DEV_PROJECT_DIR) already exists. Remove and recreate? [y/N] " confirm; \
		if [ "$$confirm" != "y" ] && [ "$$confirm" != "Y" ]; then \
			echo "Cancelled."; \
			exit 1; \
		fi; \
	fi
	@rm -rf "$(DEV_PROJECT_DIR)"
	@mkdir -p "$(DEV_PROJECT_DIR)"
	@copier copy . "$(DEV_PROJECT_DIR)" --data project_name=dev-project --answers-file "$(DEV_PROJECT_DIR)/.template.yaml" --trust
	@echo "Generated dev project in $(DEV_PROJECT_DIR)"

check: dev
	cd "$(DEV_PROJECT_DIR)" && make check

diff:
	@test -d "$(DEV_PROJECT_DIR)" || (echo "Missing $(DEV_PROJECT_DIR). Run make dev-project first."; exit 1)
	@rm -rf "$(DEV_PROJECT_COMPARE_DIR)"
	@mkdir -p "$(DEV_PROJECT_COMPARE_DIR)"
	@copier copy . "$(DEV_PROJECT_COMPARE_DIR)" --data project_name=dev-project --answers-file "$(DEV_PROJECT_COMPARE_DIR)/.template.yaml" --trust
	@diff -ruN "$(DEV_PROJECT_DIR)" "$(DEV_PROJECT_COMPARE_DIR)" || true
	@rm -rf "$(DEV_PROJECT_COMPARE_DIR)"

new-branch:
	cd template && make new-branch
