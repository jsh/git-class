You Can Understand the Objects
=============================

Let's take a first look at the contents of the `.git` repo itself
by watching it as we grow it.

Make a directory, `cd` into it, and create the repo.

    $ mkdir /tmp/$LOGNAME; cd $_; git init

This creates a git repository.

- What's there?  Use `tree -a` to inspect the contents.
        .
        └── .git
        ├── branches
        ├── config
        ├── description
        ├── HEAD
        ├── hooks
        │   ├── applypatch-msg.sample
        │   ├── commit-msg.sample
        │   ├── post-update.sample
        │   ├── pre-applypatch.sample
        │   ├── pre-commit.sample
        │   ├── prepare-commit-msg.sample
        │   ├── pre-push.sample
        │   ├── pre-rebase.sample
        │   └── update.sample
        ├── info
        │   └── exclude
        ├── objects
        │   ├── info
        │   └── pack
        └── refs
        ├── heads
        └── tags

        10 directories, 13 files

Add a file.

    $ touch README
    $ git add README

- What changes in the objects directory? [Hint: use `tree .git/objects` before and after]


        1a2,3
        > ├── e6
        > │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
        5c7
        < 2 directories, 0 files
        ---
        > 3 directories, 1 file


`git cat-file` is the Bass-O-Matic of git commands. It will tell you what you want to know about objects.

- Use `git cat-file -t e69d` to tell you what the new object is,
and `git cat-file -p e69d` to show what's in it.

        $ git cat-file -t e69d
        blob
        $ git cat-file -p e69d
        $ # it's empty
Notice: the object's SHA1 is the directory name prepended to the other 38 characters.

        $ ls .git/objects/e69 | wc -c
        39 # a 38-character name, plus the newline character

Now commit it.

    $ git commit -m"initial"

- What's changed?  Use `git cat-file` to figure out what the new objects are and what's in them.

        1a2,7
        > ├── 0d
        > │   └── 5006bb832207d5cdedc42b60a2ae19ec565db1
        > ├── 54
        > │   └── 3b9bebdc6bd5c4b22136034a95dd097a57d3dd
        > ├── e6
        > │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
        5c11
        < 2 directories, 0 files
        ---
        > 5 directories, 3 files

        $ git cat-file -t 543b
        tree
        $ git cat-file -p 543b
        100644 blob e69de29bb2d1d6434b8b29ae775ad8c2e48c5391	README
        $ git cat-file -t 0d50
        commit
        $ git cat-file -p 0d50
        tree 543b9bebdc6bd5c4b22136034a95dd097a57d3dd
        author Jeffrey Haemer <jhaemer@aircell.com> 1403187410 -0600
        committer Jeffrey Haemer <jhaemer@aircell.com> 1403187410 -0600

        initial

The tree (directory) points at the blob, the commit points at the tree and adds some meta-data.

- If you do this all over again, starting with a fresh directory and repository, what objects will be the same, and what objects will change?

The blob and tree will be the same. The commit will differ because it's at a different time.

Add a second, empty file

    $ touch foo
    $ git add foo

- What's changed? Why? What does `git status` say?

Nothing's changed. An empty-file blob is already in e69d. Git only tracks content.

- What happens when you commit it?

A new tree object appears, with both files, and a new commit, pointing at the new tree.
Notice: nothing is removed.

Add a third file that isn't empty.

    $ cat <<__EOF__ > hello
    #!/bin/bash -eu
    echo hello, world
    __EOF__
    $ chmod +x hello
    $ git add .
    $ git commit -m"The canonical program."

- Examine the results.

Now, there's a new commit, pointing at a new tree, which includes pointers to a new blob.