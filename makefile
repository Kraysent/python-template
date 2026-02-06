check:
	@uvx ruff format --quiet --config=pyproject.toml --check
	@uvx ruff check --quiet --config=pyproject.toml

fix: 
	@uvx ruff format --quiet --config=pyproject.toml
	@uvx ruff check --quiet --config=pyproject.toml --fix
