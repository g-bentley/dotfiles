# Dotfiles

## Vim

For .bashrc or .bash_profile:

Fix the shell's default editor.

    export VISUAL=vim
    export EDITOR="$VISUAL"

Quick fix if the exports do not work.

    alias vi-vim


Since almost all terminal emulators can handle full color, make sure PuTTY, et. al. play nice.

    set TERM=xterm-256color
    export TERM

## Git Directories

To get around the submodule problem, all the .git directories have been renamed to _git.
