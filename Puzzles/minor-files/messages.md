COMMIT_EDITMSG Holds the Last Commit Message
============================================

- In the top level of a fresh, scratch directory,
what's in the file `.git/COMMIT_EDITMSG`?

- If you make a fresh commit, what's there now?

- Add some text to this file by hand. Does `git show` report your change? `git log`?

- What happens to `COMMIT_EDITMSG` if you do a `git commit --amend`? (Don't add any text or make any changes.)

This file stores your comment in case the commit fails. (Git appreciates your hard work writing good comments and doesn't want you to lose them.)
Nothing else uses it.

Try this:

  $ echo hello >> README
  $ git commit -m"Deathless prose"

- Why didn't `git` do anything? What's in your `COMMIT_EDITMSG`?

- Correct your mistake, then use `git commit -F` to reuse the message.

The `git tag` command also creates a temporary file, `.git/TAG_EDITMSG`, though it's harder to see. Try this:

    $ git tag -a skin
    # git will put you into a text editor. Add a tag comment, and save it but do not exit the editor.
    # Use job control to suspend the editor, or launch another terminal to look in the .git directory
    ^Z
    [1]+  Stopped                 git tag -a skin
    $ cat .git/TAG_EDITMSG
    $ kill %1
    $ cat .git/TAG_EDITMSG

You've aborted the tag operation but the message isn't lost.

- Is there a `git tag -F` that would let you reuse the message?

[Answers here.](../../Answers/refs/messages.md)
