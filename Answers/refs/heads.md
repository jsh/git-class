The refs/heads Directory Points at Branches
===========================================

Create a new git repo, add an empty file, and an initial commit.

- What files does the commit create besides the ones in objects?

        2a3
        > ├── COMMIT_EDITMSG
        18a20,24
        > ├── logs
        > │   ├── HEAD
        > │   └── refs
        > │       └── heads
        > │           └── master
        19a26,29
        > │   ├── 54
        > │   │   └── 3b9bebdc6bd5c4b22136034a95dd097a57d3dd
        > │   ├── 76
        > │   │   └── cd030a9876ad68c0993a6e3376f048277c7e26
        25a36
        >     │   └── master
        28c39
        < 10 directories, 15 files
        ---
        > 15 directories, 21 files

Use `git branch` to create some new branches

    $ git branch pecan
    $ git branch boxelder
    $ git branch chestnut
    $ git branch

- What changes?

        $ tree .git/refs/heads

        .git/refs/heads
        ├── boxelder
        ├── chestnut
        ├── master
        └── pecan
`.git/refs/heads` has a file for each branch.

- What's in these new files?

        $ pushd .git/refs/heads
        $ grep . *
        boxelder:40111c3c9c69e2337a301bb3ecf6828c9849affd
        chestnut:40111c3c9c69e2337a301bb3ecf6828c9849affd
        master:40111c3c9c69e2337a301bb3ecf6828c9849affd
        pecan:40111c3c9c69e2337a301bb3ecf6828c9849affd
        $ git cat-file -p 40111
        tree 543b9bebdc6bd5c4b22136034a95dd097a57d3dd

        author Jeff Haemer <jhaemer@aircell.com> 1403360866 -0600
        committer Jeff Haemer <jhaemer@aircell.com> 1403360866 -0600

        initial
They're one-line files, containing nothing more than the sha1 of the branch's latest commit.

Check out one of your branches.

    $ popd  # go back to the top
    $ git checkout pecan
    $ git branch

- Are there any new files? Does refs change?

Nope.

`git checkout` just changes `.git/HEAD`, and `git branch` is reporting on it.
Check out a few more branches and watch the change.

    $ for i in master pecan chestnut boxelder; do
    >   git checkout $i
    >   cat .git/HEAD
    > done
    Switched to branch 'pecan'
    ref: refs/heads/pecan
    Switched to branch 'master'
    ref: refs/heads/master
    Switched to branch 'chestnut'
    ref: refs/heads/chestnut
    Switched to branch 'boxelder'
    ref: refs/heads/boxelder

Commit a change to **boxelder**

    $ echo helo, wrlod > hello # See? Boxelder has bugs.
    $ chmod +x hello
    $ git add .; git commit -m"the canonical program"

- Now what changes?

        $ cat .git/refs/heads/boxelder
        5e7872185d99da5304a993922c97f859e90f0a91
        $ git cat-file -p $(cat .git/refs/heads/boxelder)
        tree b6ed9115af1354deafc9bd3cdbcbf42c3cedf099
        parent 40111c3c9c69e2337a301bb3ecf6828c9849affd
        author Jeff Haemer <jhaemer@aircell.com> 1403362491 -0600
        committer Jeff Haemer <jhaemer@aircell.com> 1403362491 -0600

        the canonical program
The branch (`.git/HEAD`) stays the same,
but the contents of `.refs/heads/boxelder` moves.
A ***branch*** is a Post-It note attached to a head commit.
Every new commit on that branch moves the note
by putting a new SHA1 into a one-line textfile.
Branching is *very* fast and *very* cheap.

Check **master** back out.

- Does it change what you think it would?

It should only change `.git/HEAD`.
If not, go back and figure out what you've missed.

Delets a blighted branch

    $ git branch -d chestnut

- What's that doing?

It just deletes the one-line file refs/heads/boxelder . The sticky is gone, but the objects are still in refs/objects

