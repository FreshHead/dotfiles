#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# export EDITOR=/usr/local/bin/nvim
export EDITOR=/opt/nvim-linux64/bin/nvim

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
alias config='/usr/bin/git --git-dir=/home/u/.cfg/ --work-tree=/home/u'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

test -f ~/.git-completion.bash && . $_

# pnpm
export PNPM_HOME="/home/u/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/.tmuxifier/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
source ~/.bash_completion/alacritty
alias config='/usr/bin/git --git-dir=/home/u/.cfg/ --work-tree=/home/u'
alias config='/usr/bin/git --git-dir=/home/u/.cfg/ --work-tree=/home/u'
source ~/.bash_completion/alacritty
