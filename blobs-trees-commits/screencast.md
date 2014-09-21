### You Just Need to Know Three Kinds of Things (Okay, four.)

#### Objects have four flavors. Gotta have three.
- Blobs, Trees, and Commits
  - contrast with Linux files and directories
  - show blobs and contents
  - show trees and contents
  - need to add commits for a VCS
  - show commits and contents
  - show `git log` and `ls -il`
- In a filesystem, all you need is `/`. In commits, all you need is `HEAD`.
  - trace a series of commits with git cat-file
  - note the absence of a real `ls` analogue for commits
- Where is all this information?
  - give a quick tour of `.git` with `tree`
  - show the steps in `git init`, `git add`, `git commit`
  - show the correspondence between output of `git cat-file` and `.git/objects`
- What other analogues are there?
  - show "symlinks" with `.git/HEAD` and `git symbolic-ref`
- _Quo vadis?_ If we want to extend this a level, what could come next?
  - show branches with `git branch -a` and `.git/remotes`
  - show remotes with `git remote -v` and `.git/remotes`
  - show annotated tags with `git cat-file`
  - show `gitk` and `gitg`
