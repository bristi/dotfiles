# Managed dotfiles and related

My dotfiles, as well as some general purpose scripts (in `~/bin`), is managed using the excellent [yadm](https://github.com/TheLocehiliosan/yadm) :+1: :green_heart:

TODOS:

- [ ] Add some pre-history, mentioning deleting of old repo
- [ ] Copy/link to some usage of yadm
- [x] Copy/link to general best practice of using alternate files
- [ ] Add basic dotfiles and scripts
- [ ] Merge other configurations


## Using alternate files

### Shameless copy-paste of yadm documentation per 20161111

This section is a partial copy-paste of [https://thelocehiliosan.github.io/yadm/docs/alternates].

Strategies for alternate files on different systems

Where possible, you should try to use the same file on every system. Here are a few examples:

#### `.vimrc`

    let OS=substitute(system('uname -s'),"\n","","")
    if (OS == "Darwin")
        " do something that only makes sense on a Mac
    endif

#### `.tmux.conf`

    # use reattach-to-user-namespace as the default command on OSX
    if-shell "test -f /usr/local/bin/reattach-to-user-namespace" 'set -g default-command "reattach-to-user-namespace -l bash"'

#### `.bash_profile`

    system_type=$(uname -s)
    if [ "$system_type" = "Darwin" ]; then
        eval $(gdircolors $HOME/.dir_colors)
    else
        eval $(dircolors -b $HOME/.dir_colors)
    fi

#### `.gitconfig`

However, sometimes the type of file you are using doesn’t allow for this type of logic. If a configuration can do an “include”, you can include a specific alternate version using yadm. Consider these three files:

`.gitconfig`

    [log]
        decorate = short
        abbrevCommit = true
    [include]
        path = .gitconfig.local

`.gitconfig.local##Darwin`

    [user]
        name = Tim Byrne
        email = tim@personal.email.org

`.gitconfig.local##Linux`

    [user]
        name = Dr. Tim Byrne
        email = dr.byrne@work.email.com

Configuring Git this way includes .gitconfig.local in the standard .gitconfig. yadm will automatically link the correct version based on the operation system. The bulk of your configurations can go in a single file, and you just put the exceptions in OS-specific files.




