Annotated Tags Are Objects
==========================

In `git`, **tags** and **annotated tags** have similar names,
but they're very different.

*Tags* are names for commits. **Annotated tags** are names for *tag objects*.
Confusing, right?

I can't fix the names, but I can help you learn what each one is.

Let's make one of each:

    $ git-scratch
    $ git tag sale
    $ git tag -am"ce mai facet" guten

- What gets created in .git/objects and .git/refs?
Before

        $ tree -a .git/{objects,refs}
        .git/objects
        ├── 36
        │   └── a5d4610244a7fd1e7ee14b51f32dd20153d8fe
        ├── 54
        │   └── 3b9bebdc6bd5c4b22136034a95dd097a57d3dd
        ├── e6
        │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
        ├── info
        └── pack
        .git/refs
        ├── heads
        │   └── master
        └── tags
After

        $ tree -a .git/{objects,refs}
        .git/objects
        ├── 36
        │   └── a5d4610244a7fd1e7ee14b51f32dd20153d8fe
        ├── 48
        │   └── 8c850c707e5b9d5249713ac7d96282ec939215
        ├── 54
        │   └── 3b9bebdc6bd5c4b22136034a95dd097a57d3dd
        ├── e6
        │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
        ├── info
        └── pack
        .git/refs
        ├── heads
        │   └── master
        └── tags
            ├── guten
            └── sale

One new object and two new tags.

- What is in refs/tags/sale? refs/tags/guten?

         $ grep . .git/refs/tags/*
        .git/refs/tags/guten:488c850c707e5b9d5249713ac7d96282ec939215
        .git/refs/tags/sale:36a5d4610244a7fd1e7ee14b51f32dd20153d8fe
Both contain SHA1s.

- What kind of object does each name?

        $ for i in .git/refs/tags/*; do
        > printf "$i: "
        > git cat-file -t $(< $i)
        > done
        .git/refs/tags/guten: tag
        .git/refs/tags/sale: commit

- What is in the object that each tag points at?


        $ for i in .git/refs/tags/*; do
        > echo -e "\n== $i ==\n"
        > git cat-file -p $(< $i)
        > done
        == .git/refs/tags/guten ==

        object 36a5d4610244a7fd1e7ee14b51f32dd20153d8fe
        type commit
        tag guten
        tagger Jeff Haemer <jhaemer@aircell.com> 1403746213 -0600

        ce mai facet?

        == .git/refs/tags/sale ==

        tree 543b9bebdc6bd5c4b22136034a95dd097a57d3dd
        author Jeff Haemer <jhaemer@aircell.com> 1403745213 -0600
        committer Jeff Haemer <jhaemer@aircell.com> 1403745213 -0600

        initial

- You've seen all four kinds of git objects. What are they, and what kinds of sha1s does each contain?

blob, tree, commit, tag
-- blobs contain bytes
-- trees contain SHA1s of blobs and trees
-- commits contain the SHA1 of a tree and SHA1s of parent commits
-- tags contain the SHA1 of a commit

Oversimplifying, *tag -> commit -> tree -> blob*

- What do the files in refs/heads and refs/tags contain?

-- Files in refs/heads name commits that are branches, and move
-- Files in refs/tags name commits and tags that are fixed



