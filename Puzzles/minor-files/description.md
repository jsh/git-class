`.git/description` Is Whatever You Want It to Be
================================================

The `.git/description` file contains whatever you want.


- Go look at one that you haven't changed. What does it have in it right now?

Applications can use it. Or not. Two things that use it are `gitweb` and `hooks/post-receive-email`.
If you use these, fine. If not, who cares?
But look at it this way: if you *want* to use it in an application, subcommand, or hook that you write, you're free to.
It's guaranteed to be there.

- Write a subcommand, `git-description`, that shows the content of `.git/description`

- Improve it so that, given arguments, it sets the description

- Why can't your new command be called `git-describe`?

[Answers here.](../../Answers/minor-files/description.md)
