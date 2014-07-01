`.git/description` Is Whatever You Want It to Be
================================================

The `.git/description` file contains whatever you want.


- Go look at one that you haven't changed. What does it have in it right now?

        $ cat .git/description
        Unnamed repository; edit this file 'description' to name the repository.

Applications can use it. Or not. Two things that use it are `gitweb` and `hooks/post-receive-email`.
If you use these, fine. If not, who cares?
But look at it this way: if you *want* to use it in an application, subcommand, or hook that you write, you're free to.
It's guaranteed to be there.

- Write a subcommand, `git-description`, that shows the content of `.git/description`

        $  cat <<__EOF__ > ~/bin/git-description
        #!/bin/bash -eu
        cat $(git rev-parse --git-dir)/description
        __EOF__
        $ chmod +x  ~/bin/git-description

- Improve it so that, given arguments, it sets the description

        $  cat <<__EOF__ > ~/bin/git-description
        #!/bin/bash -eu
        desc=$(git rev-parse --git-dir)/description
        if [ "$@" ]; then
          echo "$@" > $desc
        else
          cat $desc
        fi
        __EOF__
        $ chmod +x  ~/bin/git-description

- Why can't your new command be called `git-describe`?

    `git-describe` is already a subcommand that does something else.  Try `git help describe`.
