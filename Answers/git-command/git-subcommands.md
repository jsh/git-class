When you type a `git` command, like `git show` what happens?
The `git` command itself, invokes the `git` subcommand, `git-show` .
Git subcommands are typically installed in their own directory, which isn't in your `$PATH`, but the `git` command itself knows about.

- Where are the `git` subcommands installed?

`/usr/lib/git-core`

- How many are there?

167

- How does that compare to the number of commands in each subdirectory in your `$PATH`?

        $ for i in ${PATH//:/ }; do printf "$i: "; ls $i | wc -l; done
        /home/jhaemer/bin: 9
        /usr/local/sbin: 2
        /usr/local/bin: 9
        /usr/sbin: 267
        /usr/bin: 2729
        /sbin: 250
        /bin: 152
        /usr/games: 5
A dramatic reading of that command:

        $ echo $PATH                                                    # this is your path
        $ echo ${PATH//:/ }                                             # this is your path on spaces
        $ for i in ${PATH://: }; do echo $i; done                       # process one path directory at a time
        $ for i in ${PATH://: }; do echo $i; ls $i | wc -l; done        # count entries in each dir
        $ for i in ${PATH://: }; do printf "$i: "; ls $i | wc -l; done  # beauty is truth, truth beauty