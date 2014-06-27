Symbolic Refs Act Like Symlinks
===============================

In Unix and its descendents -- like Linux, *BSD, OS/X --  real (hard) links are names for inodes.
In contrast, symbolic links are just files that contain the names of other files.

In git, refs are names for SHA1s. In contrast, symbolic refs are just files that contain the names of refs.

    $ git init hello; cd hello; touch README; git add .; git commit -m initial
    $ cat .git/HEAD

Make some refs

    $ git checkout -b pecan
    $ touch nut; git add .; git commit -m "pecan nut"

    $ git checkout master
    $ touch mind; git add .; git commit -m "master mind"

    $ git tag sale # and tag it
    $ touch piece; git add .; git commit -m "master piece"

- Look at what's under .git/refs and what's in the files.

        $ grep . .git/refs/*/*

        .git/refs/heads/master:621d3eb2e3af3a72627bd8db14ad964fe7a1ea92
        .git/refs/heads/pecan:2c6af50eeba56f61ddc2276bd55ee854e187bba5
        .git/refs/tags/sale:bca958b320c02ebeb185c30c6e8a1c684ae12eed

Let's watch `.git/HEAD` change as we checkout different things.

    $ cat .git/HEAD
    ref: refs/heads/master

    $ git branch
    * master
      pecan

    $ git checkout pecan
    Switched to branch 'pecan'
    $ cat .git/HEAD
    ref: refs/heads/pecan

    $ git branch
      master
    * pecan

- What happens when you checkout the tag `sale`?

        $ git checkout sale
        $ git branch
        * (detached from sale)
          master
          pecan
        $ cat .git/HEAD
        bca958b320c02ebeb185c30c6e8a1c684ae12eed

- How about other, non-branch checkouts, like `master^`, the parent of `master`?

        $ git checkout master^ # the parent of master
        $ git branch
        * (detached from 621d3eb)
          master
          pecan
        $ cat .git/HEAD
        621d3eb2e3af3a72627bd8db14ad964fe7a1ea92

Is it clear what git's doing? If not, go back over this material now.
We're about to do some kinkier things that will be confusing if you don't understand the material above.

First, we'll just change HEAD by hand

    $ git checkout master
    $ git branch
    * master
      pecan
    $ sed -i s/master/pecan/ .git/HEAD

- Now what do you see?

        $ git branch
          master
        * pecan

- What's git status say? What's that mean?

The command `git symbolic-ref` does this same work. Try these:

    $ git symbolic-ref HEAD pecan
    $ git branch
    $ cat .git/HEAD
    $ git symbolic-ref HEAD master
    $ git branch
    $ cat .git/HEAD

`git` understands symbolic links in other places, too

Try this:

    $ git symbolic-ref refs/heads/carya refs/heads/pecan

- Use what you've learned to look at this new symbolic ref.

        $ tree .git/refs/heads
        .git/refs/heads
        ├── carya
        ├── master
        └── pecan

        $ cat .git/refs/heads/carya
        ref: refs/heads/pecan

        $ git checkout carya
        Switched to branch 'carya'
        $ cat .git/HEAD
        ref: refs/heads/carya
        $ git branch
          carya -> pecan
          master
        * pecan

- Read the man page for git symbolic-refs, then use it to delete carya.

        $ git symbolic-ref -d refs/heads/carya