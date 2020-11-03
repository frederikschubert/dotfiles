export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/home/schubert/.oh-my-zsh"
ZSH_THEME="oxide"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(z git zsh-autosuggestions fzf colored-man-pages) 
source $ZSH/oh-my-zsh.sh

# User configuration
export LANG=en_US.UTF-8

export GOROOT="$HOME/go"
export GOPATH="$HOME/go_projects"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin:$GOBIN"

export JAVA_HOME="$HOME/local/lib64/jvm/jdk-11"
export PATH="$HOME/local/bin:$JAVA_HOME/bin:$PATH"

alias nv="nvidia-smi"
export TMUX_TMPDIR="$HOME/.tmux/$(hostname)"
mkdir -p $TMUX_TMPDIR

export WANDB_DIR="./nobackup"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/schubert/miniconda3/tmp/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/schubert/miniconda3/tmp/etc/profile.d/conda.sh" ]; then
        . "/home/schubert/miniconda3/tmp/etc/profile.d/conda.sh"
    else
        export PATH="/home/schubert/miniconda3/tmp/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"
export RPROMPT=$(hostname)

fpath+=${HOME}/.oh-my-zsh/custom/plugins/conda-zsh-completion
compinit conda

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^ ' autosuggest-accept
