import click.testing

import main


def test_cli_help_shows_usage() -> None:
    runner = click.testing.CliRunner()
    result = runner.invoke(main.cli, ["--help"])
    assert result.exit_code == 0
    assert "Usage:" in result.output
