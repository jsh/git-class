Packfiles Are a Performance Hack
===

The 16*16 = 64 subdirectories of the `.git/objects/` directory provide a performance improvement,
cutting the number of files per directory by a couple of orders of magnitude.
Nevertheless, each new file version, each new directory version, each new commit, and even each new annotated or signed tag
creates a new object. All the no-longer-accessible objects -- objects on "deleted" branches? Still there.

Eventually, something's got to give.
