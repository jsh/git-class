Git Configuration Information is Hierarchical
===

If you have a `~/.gitconfig`, move it out of the way temporarily.

    $ [ -f ~/.gitconfig ] && mv ~/.gitconfig ~/gitconfig

- In a newly-created, scratch `git` repo, what's `.git/config` look like?
How's this compare to the output of `gitconfig -l`?

        $ cat .git/config
        [core]
          repositoryformatversion = 0
          filemode = true
          bare = false
          logallrefupdates = true
        $ gitconfig -l
        core.repositoryformatversion=0
        core.filemode=true
        core.bare=false
        core.logallrefupdates=true

You can use `git config` to change properties, or you can edit the file directly. They're equivalent. If you change something that `git` knows about, it will change `git`'s behavior, but there are no restrictions on what you can put in.

- Put some things in each way and look at the results.
Options must go in a section, but sections can have multiple options, and options can have suboptions, like `haemer.girls.youngest`
                

        $ cat <<__EOF__ > .git/config
        [haemer]
            cat = fezmo
        __EOF__

        $ git config haemer.cat
        fezmo
        $ git config haemer.girls.youngest zoe
        $ tail -f .git/config
        [haemer]
          cat = fezmo
        [haemer "girls"]
          youngest = zoe

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

        $ git config --local haemer.daughters 3
        $ git config --global haemer.daughters 0
        $ git config haemer.daughters
        0
        $ git config -l
        haemer.daughters=3
        ...
        haemer.daughters=0
        $ cat ~/.gitconfig
        [haemer]
                daughters = 3

- Make a dummy change and try to commit it to your repository. What does `git` complain about? Does its advice make sense now? Follow the advice and try again.

        $ echo "We have all been Hereford." > README; git commit -am"Deja cow"
        *** Please tell me who you are.

        Run

          git config --global user.email "you@example.com"
          git config --global user.name "Your Name"

        to set your account's default identity.
        Omit --global to set the identity only in this repository.

Git will let you put anything into its configuration files, so long as the format is correct, but setting variables that git knows about can change its behavior.

- Use `git help gitconfig` see some of the config variables that `git` cares about. How many does it describe? More than you can memorize easily? Are these the only ones?

        $ git help config | perl -lane 'print if /^\s+\S+\.\S+$/'
        132
  The section on **Variables** begins
       Note that this list is non-comprehensive and not necessarily complete.





Don't forget to restore your old `.gitconfig`

    $ [ -f ~/gitconfig ] && mv ~/gitconfig ~/.gitconfig
