### Lesson 1: Git Is a Content-Addressable Filesystem

#### Learning objectives

Introduction (from prezi)

#### **1.1** Make a repo in slo-mo: Getting our feet wet

- launch a virtual machine
- make a repo
- install tree
- show what it looks like
- do it in slow motion, with `tree`
- show `git-scratch`

#### Where will we go from here?

Next Prezi slide

#### **1.2** Understand repo design: Why Linus Torvalds must be an alien

  - show how long it took to design and implement
  - contrast this with Unix and Ken Thompson -- another alien

##### Linux files have no names (like Unix)

  - review the basic, Linux filesystem design -- inodes
  - show mount as a kludge

##### Git "inode numbers" are universal

  - explain how Linus fixed the problem
  - show `.git/objects`
  - run `tree` (again) on the new repo
  - show `git cat-file`, the Swiss-Army Knife of git commands
  - use `git cat-file` from commit down to blob of README

##### **1.3** Explore what you know: function follows form

  - show that two Linux files with the same inode on the same filesystem are the same file
  - explain that in git, the object contents *makes* the SHA1 -- security and uniqueness
  - deduce that two git objects with the same contents are the same, wherever they are.
  - show that changing the contents without changing the name makes the object invalid
  - add two empty files and show with `git cat-file`
  - copy files with contents and show with `git cat-file`
  - make a new repo, add another empty file with a completely different name and show it has the same blob.

##### **1.4** Understand repo synchronization: git lets you play "go fish"

  - create a repo on GitHub
  - clone it, make a change, push it, and watch the progress report
  - make a change on GitHub, pull it, and watch the progress report

#### **1.5** See where you've come: Review

  - Git makes sense if you understand what's happening.
  - What's happening is easier to remember if you understand why
  - Git design echoes Linux filesystem design
  - Git design even fixes a Linux design bug
  - Reasoning by analogy is a win
  - The SHA1 is the analogue of the inode number -- the file's real "name"
  - Because it's derived from the contents, the name is the file is the name.
  - When git does something you didn't expect, stop, make a toy repo, and try to understand what's going on.

