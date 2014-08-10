# http://blog.bitfluent.com/post/27983389/git-utilities-you-cant-live-without
# http://superuser.com/questions/31744/how-to-get-git-completion-bash-to-work-on-mac-os-x
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
source ~/.git_completion.sh
# http://tammersaleh.com/posts/a-better-rvm-bash-prompt

# #Load in the git branch prompt script.
source ~/.git_prompt.sh

function __rvm_prompt {
  if hash rvm-prompt 2>&- ; then
    echo " `rvm-prompt i v g s`"
  fi
}

# git prompt
function __git_prompt {
  GIT_PS1_SHOWDIRTYSTATE=1
  [ `git config user.pair` ] && GIT_PS1_PAIR="`git config user.pair`@"
  __git_ps1 " $GIT_PS1_PAIR%s" | sed 's/ \([+*]\{1,\}\)$/\1/'
}

# Only show username@server over SSH.
function __name_and_server {
  if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    echo "`whoami`@`hostname -s` "
  fi
}

bash_prompt() {

  # regular colors
  local K="\[\033[0;30m\]"    # black
  local R="\[\033[0;31m\]"    # red
  local G="\[\033[0;32m\]"    # green
  local Y="\[\033[0;33m\]"    # yellow
  local B="\[\033[0;34m\]"    # blue
  local M="\[\033[0;35m\]"    # magenta
  local C="\[\033[0;36m\]"    # cyan
  local W="\[\033[0;37m\]"    # white

  # emphasized (bolded) colors
  local BK="\[\033[1;30m\]"
  local BR="\[\033[1;31m\]"
  local BG="\[\033[1;32m\]"
  local BY="\[\033[1;33m\]"
  local BB="\[\033[1;34m\]"
  local BM="\[\033[1;35m\]"
  local BC="\[\033[1;36m\]"
  local BW="\[\033[1;37m\]"

  # reset
  local RESET="\[\033[0;37m\]"

  # PS1="$BY\$(__name_and_server)$C\W$M\$(__rvm_prompt)$G\$(__git_prompt)$RESET$R →$RESET "
  PS1="$BY\$(__name_and_server)$C\W$G\$(__git_prompt)$RESET$R →$RESET "

}

bash_prompt
unset bash_prompt

# Open sublime from cmd prompt ex: (open current directory) subl .     (open a specific directory) subl /path/to/folder
alias subl="open -a /Applications/Sublime\ Text.app"

# MacOS iphone simulator. Useful if you like to test in the iPhone Simulator without having to open xcode
alias simulator='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator\.platform/Developer/Applications/iPhone\ Simulator.app'

# Good looking colors for directories
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Many node projects use this
export NODE_ENV=localdev
export PORT=3000