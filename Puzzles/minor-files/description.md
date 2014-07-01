`.git/description` Is Whatever You Want It to Be
================================================

The `.git/description` file contains whatever you want.

- Make a scratch repository. What does `.git/description` contain?

Applications can use it.
Or not.
Two things that use it are `gitweb` and `hooks/post-receive-email`.
If you use these, fine. If not, who cares?

Where I work, at Aircell,
we're using [gitlist](http://gitlist.org) as a repository browser,
because it's prettier than gitweb.
On the other hand, it doesn't come with git-core,
so we had to install it ourselves.

If you *want* to write an application, subcommand, or hook
that you uses .git/description, you're free to.
It's your repo.
It's your code.

In a free land, life is chock-a-block full of choices.

- Write a subcommand, `git-name`, that shows the contents of `.git/description`.

- Improve it so that, given arguments, it sets the description.

- Why can't your new command be called `git-describe`?

Some things in `.git`, like the objects, are known to `git clone`.
Others, like `hooks` or `COMMIT_EDITMSG` aren't.

- Which is `.git/description`?
Change it, clone the repo, then look at the description in the clone.

- Does it get transported in a `git push` or `git pull`?
