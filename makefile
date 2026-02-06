# Part below is managed by the project template - you most likely do not want to edit it

check:
	@uvx ruff format --quiet --config=pyproject.toml --check
	@uvx ruff check --quiet --config=pyproject.toml

fix: 
	@uvx ruff format --quiet --config=pyproject.toml
	@uvx ruff check --quiet --config=pyproject.toml --fix

update-template:
	copier update --conflict inline
