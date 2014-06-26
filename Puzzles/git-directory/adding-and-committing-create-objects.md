You Can Understand the Objects
=============================

Let's take a first look at the contents of the `.git` repo itself
by watching it as we grow it.

Make a directory, `cd` into it, and create the repo.

    $ mkdir /tmp/$LOGNAME; cd $_; git init

This creates a git repository.

- What's there?  Use `tree -a` to inspect the contents.

Add a file.

    $ touch README
    $ git add README

- What changes in the objects directory? [Hint: use `tree .git/objects` before and after]

`git cat-file` is the Bass-O-Matic of git commands. It will tell you what you want to know about objects.

- Use `git cat-file -t e69d` to tell you what the new object is,
and `git cat-file -p e69d` to show what's in it.

Now commit it.

    $ git commit -m"initial"

- What's changed?  Use `git cat-file` to figure out what the new objects are and what's in them.

- If you do this all over again, starting with a fresh directory and repository, what objects will be the same, and what objects will change?

Add a second, empty file

    $ touch foo
    $ git add foo

- What's changed? Why? What does `git status` say?

- What happens when you commit it?

Add a third file that isn't empty.

    $ cat <<__EOF__ > hello
    #!/bin/bash -eu
    echo hello, world
    __EOF__
    $ chmod +x hello
    $ git add .
    $ git commit -m"The canonical program."

- Examine the results.

[Answers here](../../Answers/git-directory/adding-and-committing-git-objects.md)

