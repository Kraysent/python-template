install:
	uv sync

install-dev:
	uv sync --all-extras

check:
	@find . \
		-name "*.py" \
		-not -path "./.venv/*" \
		-not -path "./.git/*" \
		-exec uv run python -m py_compile {} +
	@uvx ruff format \
		--quiet \
		--config=pyproject.toml \
		--check
	@uvx ruff check \
		--quiet \
		--config=pyproject.toml
	@uv run pytest \
		--quiet \
		--config-file=pyproject.toml

fix:
	@uvx ruff format \
		--quiet \
		--config=pyproject.toml
	@uvx ruff check \
		--quiet \
		--config=pyproject.toml \
		--fix

# only for mac as this is faster
build:
	docker build . \
		--platform linux/arm64

new-branch:
	@read -p "Branch name: " branch_name && \
	base=$$(git remote show origin | sed -n '/HEAD branch/s/.*: //p') && \
	git fetch origin $$base && \
	git checkout -b $$branch_name origin/$$base

update-template:
	copier update \
		--skip-answered \
		--conflict inline \
		--answers-file .template.yaml
