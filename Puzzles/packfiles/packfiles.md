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

- Next, run `git gc` to garbage-collect the repo. What happens?

- What's in these new files?

If you run `cat .git/objects/pack/*.pack` or `cat .git/objects/pack/*.idx`, which are binary files, your terminal may get confused.
Type `reset` to fix it.

- Make a new commit. Where's it go? If you add a new empty file, is a new blob created?

Objects are added as "normal," unpacked objects until garbage collection happens again,
but `git` knows about all the packed objects. A new empty file points at the existing blob.

- What happens when you garbage-collect the new objects, by running `git gc` again?

You can even unpack packfiles, though you'll never need to. Read the manpage for `git-unpack-objects`.

In addition to packing objects, `git gc` also packs refs. The packing is straightforward and you can quickly explore the before and after files on your own.
