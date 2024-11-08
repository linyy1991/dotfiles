# ZSH
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="bira"
plugins=(git command-not-found vi-mode z httpie emoji)

source $ZSH/oh-my-zsh.sh
#export PS1='%{$fg[$user_color]%}$(_fishy_collapsed_wd)%{$reset_color%}%(!.#.>) '

#################### CUSTOM ######################

if [ -f "$HOME/.env" ]; then
  source "$HOME/.env"
fi


export DOTFILES_PATH=$(cd "$(dirname $(readlink -m ~/.zshrc))" && git rev-parse --show-toplevel)

export NVM_DIR=$(readlink -m "$HOME/.nvm")
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

alias ls="ls -G --color=auto -F"
alias myclid="proxychains4 mycli -d"
alias curlj='proxychains4 curl --header "Content-Type: application/json"'
alias stow="stow -v"
alias mm="xmodmap ~/.xmodmap"
alias ssh="TERM=xterm ssh"
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias antlr4='java -jar /usr/local/lib/antlr/antlr-4.9.3-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'
function git_root() {
    cd $(git rev-parse --show-toplevel)
}

BASE16_SHELL="$DOTFILES_PATH/misc/shell/base16-shell/"
LIQUID_PROMPT="$DOTFILES_PATH/misc/shell/liquidprompt/"
[ -n "$PS1" ] && [ -s "$BASE16_SHELL/profile_helper.sh" ] && eval "$($BASE16_SHELL/profile_helper.sh)"
#[ -n "$PS1" ] && [ -s "$LIQUID_PROMPT/liquidprompt" ] && source "$LIQUID_PROMPT/liquidprompt"

# pyenv init
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

export CLASSPATH=".:/usr/local/lib/antlr/antlr-4.9.3-complete.jar"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
