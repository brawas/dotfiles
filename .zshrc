TERM=xterm-256color
COLORTERM=truecolor

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$HOME/Public/scripts:$HOME/.local/bin:$PATH

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Create a new node.js project
function node-project {
  git init
  npx license $(npm get init.license) -o "$(npm get init.author.name)" > LICENSE
  npx gitignore node
  npx covgen "$(npm get init.author.email)"
  npm init -y
  git add -A
  git commit -m "Initial commit"
}

# Aliases
if uname -a | grep -q microsoft; then
    alias metamask-pass="pass crypto/wallets/metamask/main/password | /mnt/c/Windows/system32/clip.exe"
	alias phantom-pass="pass crypto/wallets/phantom/password | /mnt/c/Windows/system32/clip.exe"
	alias rainbow-wallet-pass="pass crypto/wallets/rainbow/password | /mnt/c/Windows/system32/clip.exe"
else
    alias metamask-pass="pass -c crypto/wallets/metamask/main/password"
	alias phantom-pass="pass -c crypto/wallets/phantom/password"
	alias rainbow-wallet-pass="pass -c pass crypto/wallets/rainbow/password"
fi


alias ip="ip -c"
