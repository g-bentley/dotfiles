# Dotfiles

## Git Submodules

Currently, the plugins are not set to use submodules. This was mostly due to problems downloading in corporate environments. To get around the submodule problem, all the .git directories have been renamed to _git. To clone the repos just rename the directories from _git to .git.

## Terminal Colors
Since almost all terminal emulators can handle full color, make sure PuTTY, et. al. play nice. Change the TERM to one of the following, depending on environment.

    set TERM=xterm-256color
or
    set TERM=putty-256color
    
    export TERM

## DIR_COLORS

These are based on Solarized. Link one of the dotfiles/dircolors-<type> to $HOME/.dir_colors. Universal is recommended for environments with strict settings where TERM color does not work properly (RHEL 5 & 6).

Set the TERM and add the following to .bashrc or .bash_profile:

    eval (dircolors $HOME/.dir_colors)

## Vim

For .bashrc or .bash_profile:

Fix the shell's default editor.

    export VISUAL="vim"
    export EDITOR="$VISUAL"

Quick fix if the exports do not work. (RHEL 6)

    alias vi="vim"

