TERM=xterm-256color
COLORTERM=truecolor

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Public/Scripts:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git
		 zsh-autosuggestions
		 dirhistory
		 history
		 copyfile
		 #copydir
		 copybuffer
		 zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#User configuration

#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

#Start tmux at start
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

# Aliases

alias ip="ip -c"
alias ls="lsd"

