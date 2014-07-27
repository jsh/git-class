Packfiles Are a Performance Hack
===

The 16*16 = 64 subdirectories of the `.git/objects/` directory provide a performance improvement,
cutting the number of files per directory by a couple of orders of magnitude.
Nevertheless, each new file version, each new directory version, each new commit, and even each new annotated or signed tag
creates a new object. All the no-longer-accessible objects -- objects on "deleted" branches? Still there.

Eventually, something's got to give.

Normally, `git` handles this problem for you, under-the-covers. To get a better feel for how it's doing this,
let's do something about them by hand.

- Make a scratch repo, run `tree .git/objects` to see what's there. What size is it?

        $ git-scratch
        $ tree .git/objects > /tmp/ante
        $ du -sh .git/objects > /tmp/a
        
- Next, run `git gc` to garbage-collect the repo. What happens?

        $ git gc
        $ tree .git/objects > /tmp/post
        $ du -sh .git/objects > /tmp/p
        $ cat /tmp/{a,p}
        36K	.git/objects
        24K	.git/objects
        $ vi -O /tmp/{ante,post}
The objects have been *packed*.

- What's in these new files?

        $ find .git/objects -type f | xargs file
        .git/objects/pack/pack-490808f47e57b98d35f1c2ef22c9c223a30593c2.idx:  Git pack index, version 2
        .git/objects/pack/pack-490808f47e57b98d35f1c2ef22c9c223a30593c2.pack: Git pack, version 2, 3 objects
        .git/objects/info/packs:                                              ASCII text
        $ cat .git/objects/info/packs
        P pack-490808f47e57b98d35f1c2ef22c9c223a30593c2.pack
This is just a list of packfiles. In this case, there's just one.

If you run `cat .git/objects/pack/*.pack` or `cat .git/objects/pack/*.idx`, which are binary files, your terminal may get confused.
Type `reset` to fix it.

- Make a new commit. Where's it go? If you add a new empty file, is a new blob created?

        $ touch EMPTY; git add EMPTY; git commit -m"Another empty file"
        $ tree .git/objects
        $ git cat-file -t e69de
        blob

Objects are added as "normal," unpacked objects until garbage collection happens again,
but `git` knows about all the packed objects. A new empty file points at the existing blob.

- What happens when you garbage-collect the new objects, by running `git gc` again?

    The old packfile and related files are replaced by a new set.

You can even unpack packfiles, though you'll never need to. Read the manpage for `git-unpack-objects`.

In addition to packing objects, `git gc` also packs refs. The packing is straightforward and you can quickly explore the before and after files on your own.

        $ cat .git/packed-refs
