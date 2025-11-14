"""Console script for trickyrick."""

import typer
from rich.console import Console
import cowsay

from trickyrick import utils
from trickyrick.drawings import rick

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
# 8) It goes completely into the song
# 9) Finishes and says "You've been rick rolled... visit here to roll others: [LINK]"


@app.command()
def main():
    """Console script for trickyrick."""
    console.print("Replace this message by putting your code into trickyrick.cli.main")
    console.print("See Typer documentation at https://typer.tiangolo.com/")
    utils.do_something_useful()
    txt = cowsay.draw("Never gonna give you up 🎶", rick, to_console=False)
    txt2 = cowsay.get_output_string("beavis", "Hehehe")
    cowsay.cow("hello")
    print(txt)
    print(txt2)


if __name__ == "__main__":
    app()
