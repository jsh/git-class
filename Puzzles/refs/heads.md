The refs/heads Directory Points at Branches
====

Create a new git repo, add an empty file, and an initial commit.

- What files does the commit create besides the ones in objects?

Use `git branch` to create some new branches

    $ git branch pecan
    $ git branch boxelder
    $ git branch chestnut
    $ git branch

- What changes?
- What's in these new files?

Check out one of your branches.

    $ git checkout pecan
    $ git branch

- Are there any new files? Does refs change?

`git checkout` is changing `.git/HEAD`, and `git branch` is reporting on it.

Check out a few more branches and watch the change.

    $ for i in master pecan chestnut boxelder; do
    >   git checkout $i
    >   cat .git/HEAD
    > done

Commit a change to **boxelder**.

    $ echo helo, wrlod > hello # See? Boxelder has bugs.
    $ chmod +x hello
    $ git add .; git commit -m"the canonical program"

- Now what changes?

Check **master** back out.

- Does it change what you think it would?

Delets a blighted branch

    $ git branch -d chestnut

- What's that doing?


[Answers here.](../../Answers/refs/heads.md)