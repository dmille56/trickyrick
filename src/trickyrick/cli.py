"""Console script for trickyrick."""

import typer
from rich.console import Console

from email.utils import formataddr
from smtplib import SMTP_SSL, SMTPException
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from trickyrick import utils

app = typer.Typer()
console = Console()

# :NOTE:
# 1) impressive splash screen ASCII art with SFX
# 2) impressive_name... next... gen... music... player (pauses w/ SFX inbetween)
# 3) go through app setup
# 4) a glitch apears that says "never gonna give"
# 5) acts like nothing is wrong
# 6) another glitch appears that says "never gonna give"
# 7) another glitch appears that says "never gonna give"


@app.command()
def main():
    """Console script for trickyrick."""
    console.print("Replace this message by putting your code into trickyrick.cli.main")
    console.print("See Typer documentation at https://typer.tiangolo.com/")
    utils.do_something_useful()


if __name__ == "__main__":
    app()
