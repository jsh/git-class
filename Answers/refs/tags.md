Tags Are like Immutable Branches
================================

(Git has two kinds of tags. First, we'll consider the light-weight flavor.)

Make a new repo, commit to it, then tag it a few times.

    $ git init hello; cd hello; touch README; git add README
    $ for i in discount ear skin; do
    > git tag $i
    > done
        
- Verify that no new objects have appeared.

        .git/objects
        ├── 54
        │   └── 3b9bebdc6bd5c4b22136034a95dd097a57d3dd
        ├── b0
        │   └── 2c56373937c14b6efdbf9ea0161ee20beb4a17
        ├── e6
        │   └── 9de29bb2d1d6434b8b29ae775ad8c2e48c5391
        ├── info
        └── pack

- How has refs/ changed?

        .git/refs
        ├── heads
        │   └── master
        └── tags
            ├── discount
            ├── ear
            └── skin

- What's in the tags?

        $ grep . .git/refs/tags/*
        .git/refs/tags/discount:b02c56373937c14b6efdbf9ea0161ee20beb4a17
        .git/refs/tags/ear:b02c56373937c14b6efdbf9ea0161ee20beb4a17
        .git/refs/tags/skin:b02c56373937c14b6efdbf9ea0161ee20beb4a17
Just like branches, the tags are one-line files that contain SHA1s of commits.

Make a branch and commit to it, then return to master and commit to it.

    $ git checkout -b eucalyptus
    $ touch koala
    $ git add koala; git commit -m"commit on eucalyptus"
    $ git touch bate; git commit -m"commit on master"

- What does refs look like now? Have the tags moved?

        .git/refs
        ├── heads
        │   ├── eucalyptus
        │   └── master
        └── tags
            ├── discount
            ├── ear
            └── skin

        $ grep . .git/refs/tags/*
        .git/refs/tags/discount:b02c56373937c14b6efdbf9ea0161ee20beb4a17
        .git/refs/tags/ear:b02c56373937c14b6efdbf9ea0161ee20beb4a17
        .git/refs/tags/skin:b02c56373937c14b6efdbf9ea0161ee20beb4a17
The branches moved for each commit, but the tags didn't change.

Check out a tag.

    $ git checkout discount

- Read what git's telling you. Does it make sense?

- Add a file and make a commit anyway.
How does .git/objects change?
Use `git cat-file -t` and `git cat-file -p` to examine the new objects.
What are they?
Does the tag change?

The commit succeeds, and adds new tree and commit objects (and a new blob, if the file has new contents). The tag doesn't change.

Check out master. Check out the tag.

    $ git checkout master; ls
    bate README
    $ git checkout discount; ls
    README

Now check out the commit that you just made a minute ago to get back the file `bate`

    $ git checkout 
    
Whoops.

Tags and branches are just ways to name commits.
The commit that a tag names never changes.
The commit that a branch names changes every time you commit to a branch.
You can check out any commit, but if you don't know its name,
you need to know its SHA1.

    $ git checkout b02c56373937c14b6efdbf9ea0161ee20beb4a17; ls
    half-off README

If you have a good memory for hex numbers, you could just memorize all your commits.

Tag this commit and look at the tag.

  $ git tag sale
  $ cat .git/refs/tags/sale
  b02c56373937c14b6efdbf9ea0161ee20beb4a17

- What happens if you delete the tag with `git tag -d sale`?

The `refs/tags/sale` goes away, but the objects remain. The commit goes back to something you can only find by knowing its SHA1.
