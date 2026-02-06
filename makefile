check:
	@find . -name "*.py" -not -path "./.venv/*" -not -path "./.git/*" -exec uv run python -m py_compile {} +
	@uvx ruff format --quiet --config=pyproject.toml --check
	@uvx ruff check --quiet --config=pyproject.toml

fix:
	@uvx ruff format --quiet --config=pyproject.toml
	@uvx ruff check --quiet --config=pyproject.toml --fix

# only for mac as this is faster
build:
	docker build . --platform linux/arm64

update-template:
	copier update --skip-answered --conflict inline --answers-file .template.yaml
