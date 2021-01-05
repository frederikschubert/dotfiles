if [ "$(uname 2>/dev/null)" != "Linux" ]; then
    IS_LINUX=false
else
    IS_LINUX=true
fi

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="oxide"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"
plugins=(z git zsh-autosuggestions fzf colored-man-pages aws)
source $ZSH/oh-my-zsh.sh
source ${HOME}/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh

# User configuration
export LANG=en_US.UTF-8

if [ "$IS_LINUX" = true ]; then
    export GOROOT="$HOME/go"
    export GOPATH="$HOME/go_projects"
    export GOBIN="$GOPATH/bin"
    export PATH="$PATH:$GOROOT/bin:$GOBIN"
    export JAVA_HOME="$HOME/local/lib64/jvm/jdk-11"
    export WANDB_DIR="/localstorage/schubert"
    alias nv="nvidia-smi"
    # >>> conda initialize >>>
    __conda_setup="$('/home/schubert/miniconda3/tmp/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
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
else
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2>/dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
    export JAVA_HOME="/Library/Java/JavaVirtualMachines/openjdk-14.0.2.jdk/Contents/Home"
    function coderf() {
        code --file-uri "vscode-remote://ssh-remote+tntre/home/schubert/$1"
    }

    function coderd() {
        code --folder-uri "vscode-remote://ssh-remote+tntre/home/schubert/$1"
    }
    export NVM_DIR="$HOME/.nvm"
    [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"                           # This loads nvm
    [ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion" # This loads nvm bash_completion

    source ~/.iterm2_shell_integration.zsh
    alias rsync="rsync -vaurz --info=progress2"
    export PIP_REQUIRE_VIRTUALENV=false
fi

export PATH="$HOME/local/bin:$JAVA_HOME/bin:$PATH"
export TMUX_TMPDIR="$HOME/.tmux/$(hostname)"
mkdir -p $TMUX_TMPDIR


export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=1"
export RPROMPT=$(hostname)

fpath+=${HOME}/.oh-my-zsh/custom/plugins/conda-zsh-completion
compinit conda

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --no-ignore . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --no-ignore  . "$1"
}

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude ".git"'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

