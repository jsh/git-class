Overview
=========

***Give a man a fish, and you feed him for a day. Teach a man to fish, and you give him liver flukes.***

This material, and the
[Prezi-based presentation](http://prezi.com/l3t4eheimfpm/git-under-the-covers/) that goes with it,
will give you a deeper understanding of `git`.

The fastest way to stop stumbling around in `git` and start understanding what you're doing is to understand how `git` works.

It's not hard.

The textual material is built around a series of puzzles to work through.
None of them is supposed to be hard, but I supply answers in case I'm wrong about that.

Surprisingly, nothing in this material will require that you write, or even read, programs.

You will see no C, no Java, no Go or C# or Haskell.
You will not need to learn Ruby or Python or PHP or Javascript.
You will see certainly see bash. but mostly simple, one-liners.

There will be occasional one-liners in Perl, used as command-line filters.
Even these could probably have been in `sed` or `awk`, but why?
`Perl` is ubiquitous, exept, perhaps, on embedded Linux systems, and there is no better tool for filtering on the occasional regular expression.
If, however, you are manipulating git repos that are resident on your Android phone,
you will need to roll up your sleeves and replace the calls to `perl` with something else.

You will not need root access. Git expects you to make, use, and destroy git repos as yourself.

Dollar signs at the beginnings of lines are shell prompts.
There is no "git-specific scripting language."  It would not have occurred to me to say this,
but the first person nice enough to look at this material, Kevin Cohen,
said he was expecting one, and assumed that my bash snippets were in it.

Paradoxically, while git is bigger and more sophisticated than other version control systems, it is also simpler and easier-to-understand.
There's very little magic. Stuck on a desert island, without a compiler, you could re-implement git in user-level commands (though it might not be as fast).

What you probably could not do, without knowing this material, is design it.

Environment
-----------

I'll tell you mine. YMMV

I use git on the command line. It's a power tool for developers, built by Linus Torvalds to manage the Linux kernel.
When I give commands or paths, it's as a Linux user, doing things from a terminal window.

I'm running Ubunu 14.04 (LTS) right now.

Aside from installing packages when I discover I need them, I leave my distro fairly stock,
so I don't have to re-customize every time I re-install: bash, gnome, unity.

I take updates frequently.

I upgrade to a new LTS every two years, when it comes out. Sometimes, I have to learn how to do old things in new ways.
I treat this as a feature, not a bug.

If you work differently, or run some other Linux flavor, details may differ,
but you won't have much trouble translating on the fly.

If you work with git through a gui tool or an IDE, or run it on Windows or a Mac, YMMV.

I'm saying this once, at the outset, to keep from having to say it all over the place as I go along.

File Format
-----------

Files with the suffix ".md" are textfiles formatted with GitHub-flavored markdown.
This repo is on GitHub, and Markdown is unobtrusive enough that I can get a fair amount of bang-for-the-buck by using it. They should format nicely on GitHub, without making them hard to read or manipulate as text.

Directory contents
------------------

`Puzzles` has material for self-study.
`Answers` has sample answers.
The puzzles aren't meant to be hard or tedious, just thought-provoking.
I suggest working through them before looking at my "answers," because your solution will probably be as good as mine, and it'll give you a chance to contrast the two.

Tools
-----

*Unfortunately most students, whether through their own fault
or the fault of their instructors, seem to be dreadfully afraid
of making technical mistakes. 

You should understand that these mistakes are unavoidable.

The sooner you make your first five thousand mistakes 
the sooner you will be able to correct them.*

  -- Kimon Nicolaides

We'll learn git by experiments. Some of them won't work.

In the process, you will make a lot of throw-away repos. The git paradigm for this is

    $ git init mydir
    $ cd mydir
    $ touch README
    $ git add .
    $ git commit -m initial

To save some typing, I use a shell function,
`bin/git-scratch`, that does these preliminaries.
If you want to try it, source the function definition, then invoke it.

    $ source bin/git-scratch
    $ git-scratch

(The function also does a `pushd` into the repo.
When you're done, you can just `popd` back to where you invoked it.)

If you find yourself using it a lot, add it to your `~/.bashrc`.
Note that it has to be a function (or an alias) because of the directory change.
