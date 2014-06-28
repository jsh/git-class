Git Configuration Information is Hierarchical
===

If you have a `~/.gitconfig`, move it out of the way temporarily.

    $ [ -f ~/.gitconfig ] && mv ~/.gitconfig ~/gitconfig

- In a newly-created, scratch `git` repo, what's `.git/config` look like?
How's this compare to the output of `gitconfig -l`?

You can use `git config` to change properties, or you can edit the file directly. They're equivalent. If you change something that `git` knows about, it will change `git`'s behavior, but there are no restrictions on what you can put in.

- Put some things in each way and look at the results.
Options must go in a section, but sections can have multiple options, and options can have suboptions, like `haemer.girls.youngest`

If you remember the name of an option, you can get it with `git config`

    $ git config remote.origin.url
    git@github.com:jsh/git-class.git

you can paw through the output of `git config -l`

    $ git config -l | grep url
    remote.origin.url=git@github.com:jsh/git-class.git

you can use fancy `git config` options

    $ git config --get-regexp url
    remote.origin.url git@github.com:jsh/git-class.git

or you can just edit the file and look for what you want.

Git's configuration files are hierarchical -- `.git/config` < `~/.gitconfig` < `/etc/gitconfig` -- with more local values overriding more global ones, a data-dual of subclassing.

You can set options at these levels with the flags `--local` `--global` and `--system`, though you can only set system values if file permissions permit.

- Set `haemer.daughters` to `0` locally and `3` globally, then run `git config daughgters` and `git config -l` to see what you get. Look in `~/.gitconfig` and `.git/config` to see what changed. Does it make sense? Order matters.

- Make a dummy change and try to commit it to your repository. What does `git` complain about? Does its advice make sense now? Follow the advice and try again.

Git will let you put anything into its configuration files, so long as the format is correct, but setting variables that git knows about can change its behavior.

- Use `git help gitconfig` see some of the config variables that `git` cares about. How many does it describe? More than you can memorize easily? Are these the only ones?

Don't forget to restore your old `.gitconfig`

    $ [ -f ~/gitconfig ] && mv ~/gitconfig ~/.gitconfig

[Answers here.](../../Answers/gitconfig/basics.md)
