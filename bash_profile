# 2016-07-13 - Aliases to make it all better.
# Protect us from ourselves:
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -G --color'
# 2016-09-16 - System Vim does not work correctly in El Capitan with clipboard. Use brew installed version.
# 2016-09-16 - System Vim does not work correctly in El Capitan with clipboard
alias vi='vim'

# 2016-07-12 - Make Homebrew play nice.
# Keep Homebrew quiet. My company requires this and I like the privacy.
# https://git.io/brew-analytics
export HOMEBREW_NO_ANALYTICS=1

# Super secret Github API token for Homebrew.
# Go get your own!
# Moved to ~/.private/secrets

export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
# https://gist.github.com/quickshiftin/9130153
# Short of learning how to actually configure OSX, here's a hacky way to use
# GNU manpages for programs that are GNU ones, and fallback to OSX manpages otherwise
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

# 2016-08-25 - Docker environment
# 2016-09-01 - This no longer works with Docker for Mac.
#eval $(docker-machine env default)

# 2016-11-21 - Perl development - Homebrew with local path.

###PATH="/Users/gbentley/perl5/bin${PATH:+:${PATH}}"; export PATH;
###PERL5LIB="/Users/gbentley/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
###	PERL5LIB="/Users/gbentley/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}:/Users/gbentley/Projects/http/rewrite/pm"; export PERL5LIB;
###	PERL_LOCAL_LIB_ROOT="/Users/gbentley/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
###	PERL_MB_OPT="--install_base \"/Users/gbentley/perl5\""; export PERL_MB_OPT;
###	PERL_MM_OPT="INSTALL_BASE=/Users/gbentley/perl5"; export PERL_MM_OPT;
###	# Perl Critic fix for Eclipse
PERLCRITIC=~/.perlcriticrc

# Better github with hub
###eval "$(hub alias -s)"

# Perlbrew
. ~/perl5/perlbrew/etc/bashrc

[[ -d ~/.bash_completion.d ]] && . ~/.bash_completion.d/ssh

# 2016-07-25 - Fix for Node / npm indexing problem.
alias node='node --max-old-space-size=8192'
alias npm='node --max-old-space-size=8192 /usr/local/bin/npm'

# Set LSCOLORS:
eval $(dircolors $HOME/.dir_colors)
# Tcl/Tk patch:
#export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
#export PYENV_ROOT=/usr/local/bin/pyenv
#eval "$(pyenv init -)"
###if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
.  /usr/local/bin/virtualenvwrapper.sh

# Those things you do not want floating around the Internet, like API keys:
[[ -f ~/.private/secrets ]] && . ~/.private/secrets

