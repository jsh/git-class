## Git's Design Makes Sense

###To Understand Git, Think Like Linus

#### Git is a content-addressable filesystem. Why?
- Git files have no names
  - git cat-file
- Git inode numbers are universal
  - contrast with Linux
  - show an example: two files with different names and the same blob
- Sha1 lets you play Go Fish
  - show the dialogue for git fetch

---

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

### SCM History Helps it Make Sense
#### What came before? What's coming next?
- A brief history by decade: `sccs`, `rcs`, `cvs` (and `svn`), `git`, et al.
  - Why each became a dinosaur
- What `git` gets you. Use cases for DVCS:
  - removing the Linux-development bottleneck
  - flying to Bucharest or Tokyo
  - collaborating at a conference or coffee shop
  - personal branches and tags
  - show an example of `svn` vs. `git` speed
- The hard problems: diffing and merging
  - `git diff`, `git merge`, `git rebase`
- Successful tools create their own ecosystem. Some examples
  - CVSDude -> CollabNet
  - GitHub: if it's a DVCS, what's the point?
    - show GitHub
    - show `git clone` from GitHub
    - show sample exercises on GitHub
  - GitHub Services
    - show an example (DockerHub?)
  - `git`'s simple design makes it easy to build commands on top of it.
    - show `gitg` again
    - show `.gitconfig` and `git lol`
    - show `git-scratch`
- _Quo vadis?_ What's replaces `git`?
  - What's missing? (What have folks built?)
    - Workflow
      - show `git flow`
      - show `git-flow`, `/usr/lib/git-core` and how `/usr/bin/git` work
      - show `.git/config`
      - mention GitHub workflow and Code School's **Mastering GitHub** video
    - Handling multiple repos.
      - show `git submodule`, Google's `repo`
    - Access control
      - show `gitolite`
      - show `gerrit`
    - It's up to you, isn't it?

### Branches and Tags are Post-it Notes
#### Annotated tags are the fourth object type.
### Review: How's this perspective help?
#### Think History. Think Linus. Think "How would I do this?" Think "What's in it for me?"

---
---
## Rootin' Around in `.git`

### Everything `git` does is in `.git`. Almost
### Here's What Creating a Repo Does
#### And here's adding, changing, and celeting files and folders.
### "Refs and Branches and Tags, Oh My!"
### Cloning and Remotes, 
#### Fetches and pushes (and deletes)
### Other Important Locations: Looking for `git` in All the Wrong Places
#### Where is `git` itself?
#### You can add commands to /usr/lib/git-core
#### `~/.gitconfig` holds configuration information
#### `~/.gitignore` tells git what to ignore
---
## "You Can Observe a Lot by Watching": `git status` and `gitk`
### I run `git status` a lot. If you don't, maybe you know `git` better than I do.
### `gitk` works, it's just ugly: `gitg`
### [Visualize what `git` commands do with your browser] {https://onlywei.github.io/explain-git-with-d3/}
---
## Quo Vadis? "Prediction is very difficult, especially about the future."

### The Curse of Flexibility: Managing Work Flow `git flow` and the GitHub model
### Handling Multiple Repos: `git submodule`, `git subtree`, `Google's repo`
### "Don't Step on my Blue Suede Shoes": `gitolite` and `gerrit`
