Symbolic Refs
=============

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

- How about other, non-branch checkouts, like `master^`, the parent of `master`?

Is it clear what git's doing? If not, go back over this material now.
We're about to do some kinkier things that will be confusing if you don't understand the material above.

First, we'll just change HEAD by hand

    $ git checkout master
    $ git branch
    * master
      pecan
    $ sed -i s/master/pecan/ .git/HEAD

- Now what do you see?

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

- Read the man page for git symbolic-refs, then use it to delete carya.
