`.git/description` Is Whatever You Want It to Be
================================================

The `.git/description` file contains whatever you want.

- Make a scratch repository. What does `.git/description` contain?

        $ git-scratch
        $ cat .git/description
        Unnamed repository; edit this file 'description' to name the repository.

Applications can use it.
Or not.
Two things that use it are `gitweb` and `hooks/post-receive-email`.
If you use these, fine. If not, who cares?

Where I work, at Aircell,
we're using [gitlist](http://gitlist.org) as a repository browser,
because it's prettier than gitweb.
On the other hand, it doesn't come with git-core,
so we had to install it ourselves.

If you *want* to write an application, subcommand, or hook
that you uses .git/description, you're free to.
It's your repo.
It's your code.

In a free land, life is chock-a-block full of choices.

- Write a subcommand, `git-name`, that shows the contents of `.git/description`.

        $  cat <<__EOF__ > ~/bin/git-name
        #!/bin/bash -eu
        cat $(git rev-parse --git-dir)/description
        __EOF__
        $ chmod +x  ~/bin/git-name

- Improve it so that, given arguments, it sets the description.

        $  cat <<__EOF__ > ~/bin/git-name
        #!/bin/bash -eu
        desc=$(git rev-parse --git-dir)/description
        if [ "$@" ]; then
          echo "$@" > $desc
        else
          cat $desc
        fi
        __EOF__
        $ chmod +x  ~/bin/git-name

- Why can't your new command be called `git-describe`?

    `git-describe` is already a subcommand that does something else.
Try `git help describe`.

Some things in `.git`, like the objects, are known to `git clone`.
Others, like `hooks` or `COMMIT_EDITMSG` aren't.

- Which is `.git/description`?
Change it, clone the repo, then look at the description in the clone.

        $ git scratch
        $ git name "My name is 'Legion'"
        $ pushd   # to return to where we started
        $ cd ..; git clone git-scratch.d git-scratch2.d
        $ grep . git-scratch*/.git/description
        git-scratch2.d/.git/description:Unnamed repository; edit this file 'description' to name the repository.
        git-scratch.d/.git/description:My Name is 'Legion'

- Does it get transported in a `git push` or `git pull`?

        No.
