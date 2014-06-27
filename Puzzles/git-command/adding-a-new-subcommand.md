Installing some packages, like `git-flow`, installs new sub-commands.
=========================================

- What new commands are installed by `git-flow`?

Two can play at that game.

- Install this script as `git-hello`.

        #!/bin/bash -eu
        echo "hello, git"

Now type the command `git hello`
Does it work?

New subcommands can be anywhere in your path, so you can have private subcommands.

- Create a new command, `git-foo` that prints "FOO!", install it in `~/bin` and try it out.

[Answers here.](../../Answers/git-command/adding-a-new-subcommand.md)
