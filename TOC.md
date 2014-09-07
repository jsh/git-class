## Git's Design Makes Sense

###To Understand Git, Think Like Linus
#### Git is a content-addressable filesystem. Why?
### You Just Need to Know Three Kinds of Things (Okay, four.)
#### Objects have four flavors. Gotta have three.
### SCM History Helps it Make Sense
#### What came before? What's coming next?
### Branches and Tags are Post-it Notes
#### Annotated tags are the fourth object type.
### Review: How's this perspective help?
#### Think History. Think Linus. Think "How would I do this?" Think "What's in it for me?"

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
