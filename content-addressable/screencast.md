### Git Is a Content-Addressable Filesystem

Introduction (from prezi)

#### Getting our feet wet
- launch a virtual machine
- make a repo
- install tree
- show what it looks like
- do it in slow motion, with tree
- show git-scratch

#### Where do we go from here?

Next Prezi slide

#### Linus wrote it faster than humans could

Numbers on this: contrast with Ken Thompson and Unix

#### Linux files have no names (like Unix)

review the basic, Linux filesystem design -- inodes
show mount as a kludge

#### Git "inode numbers" are universal
explain how Linus fixed the problem
show .git/objects
show tree (again) on the new repo
show git cat-file, the Swiss-Army Knife of git commands
use git cat-file from commit down to blob of README

#### Deduction: two files with the same contents have the same blob and sha1

In Linux, two files with the same inode on the same filesystem are the same file
In git, because the sha1 is tied to the contents, two files with the same contents are the same, wherever they are.

- add two empty files and show with git cat-file
- copy files with contents and show with git cat-file
- make a new repo, add another empty file with a completely different name and show it has the same blob.

#### Git lets you play "go fish"

- create a repo on GitHub
- clone it, make a change, push it, and watch the progress report
- make a change on GitHub, pull it, and watch the progress report

#### Review

- This stuff's going to make more sense if you understand what's happening.
- What's happening is easier to remember if you understand why
- Git design echoes Linux filesystem design
- Git design even fixes a Linux design bug
- Reasoning by analogy is a win
- The sha1 is the analogue of the inode number -- the file's real "name"
- Because it's derived from the contents, the name is the file is the name.

