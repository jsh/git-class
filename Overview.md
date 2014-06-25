Overview
=========

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

Prezi
-----

This repo accompanies a Prezi-based presentation. The URL of the presentation is in the `Prezi` file.

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

