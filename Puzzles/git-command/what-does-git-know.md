What's `git` know about?
======================

The `git` command is just a front end.

Let's build a one-liner to show what it knows about.

    $ which git                       # tells you where git is
    $ file $(which git)               # tells you it's a binary
    $ strings $(which git)            # tells you what printable strings are in the binary
    $ strings $(which git) | grep ^/  # which printable strings might be absolute paths
    $ for i in $(strings $(which git) | grep ^/); do [ -e $i ] && echo $i; done
    # which strings actually are absolute paths

- What is each one?
- Why does `git` know about them?

[Answers here.](../../Answers/git-command/what-does-git-know.md)
