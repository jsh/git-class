Installing some packages, like `git-flow`, installs new sub-commands.
=========================================

- What new commands are installed by `git-flow`?

        $ ls /usr/lib/git-core/git-flow*
        /usr/lib/git-core/git-flow	        /usr/lib/git-core/git-flow-init
        /usr/lib/git-core/git-flow-config   /usr/lib/git-core/git-flow-release
        /usr/lib/git-core/git-flow-feature  /usr/lib/git-core/git-flow-support
        /usr/lib/git-core/git-flow-hotfix   /usr/lib/git-core/git-flow-version

Two can play at that game.

- Install this script as `git-hello`.

        #!/bin/bash -eu
        echo "hello, git"

Now type the command `git hello`
Does it work?

        $ git hello
        git: 'hello' is not a git command. See 'git --help'.
        $ cat <<__EOF__
        #!/bin/bash
        echo hello, git
        __EOF__
        $ chmod +x git-hello
        $ sudo install git-hello /usr/lib/git-core/
        $ rm -rf git-hello # so git doesn't find it here
        $ git hello
        hello, git