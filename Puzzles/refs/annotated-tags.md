Annotated Tags Are Objects
==========================

In `git`, **tags** and **annotated tags** have similar names,
but they're very different.

*Tags* are names for commits. **Annotated tags** are names for *tag objects*.
Confusing, right?

I can't fix the names, but I can help you learn what each one is.

Let's make one of each:

    $ git-scratch
    $ git tag sale
    $ git tag -am"ce mai facet" guten

- What gets created in .git/objects and .git/refs?

- What is in refs/tags/sale? refs/tags/guten?

- What kind of object does each name?

- What is in the object that each tag points at?

- You've seen all four kinds of git objects. What are they, and what kinds of sha1s does each contain?

- What do the files in refs/heads and refs/tags contain?

[Answers here.](../../Answers/refs/annotated-tags.md)
