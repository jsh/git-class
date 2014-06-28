When you type a `git` command, like `git show` what happens?
The `git` command itself, invokes the git-subcommand, `git-show` .
Git subcommands are typically installed in their own directory, which isn't in your `$PATH`, but the git command itself knows about.

- Where are the `git` subcommands installed?
- How many are there?
- How does that compare to the number of commands in each subdirectory in your `$PATH`?

[Answers here.](../../Answers/git-command/git-subcommands.md)