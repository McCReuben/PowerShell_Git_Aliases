# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# export PATH=/mnt/c/Users/Ruby/AppData/Roaming/Python/Python39/site-packages/:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
#ZSH_THEME="random"
ZSH_THEME="daveverwer"
# ZSH_THEME="dracula"
### Prompt
# export PROMPTbase='%{$fg[red]%}%m%{$reset_color%}:%{$fg[green]%}%c%{$reset_color%}$(git_prompt_info) %(!.#.$)'
export PROMPTbase='%(1V:%F{yellow}:%(?:%F{green}:%F{red}))%B$(dracula_arrow start)%F{green}%B$(dracula_time_segment)%F{magenta}%B$(dracula_context)%F{blue}%B$(dracula_directory)$(custom_variable_prompt)$DRACULA_GIT_STATUS%(1V:%F{yellow}:%(?:%F{green}:%F{red}))%B$(dracula_arrow end)%f%b'
export PROMPTpre='(base) '
export PROMPT="$PROMPTpre$PROMPTbase"

## ENVIRONMENT VARIABLES
### Navigation
export ME=/mnt/c/Users/Ruby
export DL=$ME/Downloads
export WK=$ME/workspace
export CONDA=$ME/anaconda3
export CONDAenv=$CONDA
export CONDAEXE=$CONDA/Library/bin
export CONDAsp=$CONDA/lib/site-packages
export CONDAsc=$CONDA/Scripts
export SWIG_PATH=$CONDAsp/swig/bin
export FEDORA_IP=10.0.0.59




export PATH=$CONDAsp:$SWIG_PATH:$PATH

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

function gcmd() {
    echo "git commit -m '$1' --date='$2 $(shuf -i 9-22 -n 1):$(shuf -i 0-59 -n 1):$(shuf -i 0-59 -n 1)'"
}

function reinstall() {
    pip uninstall $1
    pip install $1
}

function chromeram() {
    /mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe --js-flags=\"--max_old_space_size=$1\"
}

function act() {
  if [ -d "$CONDA/envs/$1" ] || [ "$1" = "base" ]; then
    if [ "$1" = "base" ]; then
        export CONDAenv="$CONDA"
    else
        export CONDAenv="$CONDA/envs/$1"
    fi
    #change the alias
    alias pip="$CONDAenv/Scripts/pip.exe"
    alias plzpip="sudo $CONDAenv/Scripts/pip.exe" 
    alias python="$CONDAenv/python.exe"
    alias py="$CONDAenv/python.exe"
    export PROMPTpre="($1) "
    export PROMPT="$PROMPTpre$PROMPTbase"
    echo "Succesfully loaded environment $1"
  else
    echo "Error: Environment '$CONDA/envs/$1' does not exist."
  fi
}

## ALIASES
### Git
alias git="/mnt/c/Program\ Files/Git/cmd/git.exe"
alias gcm="git commit -m"
alias gs="git status"

### Python/Pip Environment
alias python="$CONDA/python.exe"
alias py="$CONDA/python.exe"
alias pip="$CONDAsc/pip.exe"
alias pip38="$CONDA/envs/py3.8/Scripts/pip.exe"
alias plzpip="sudo $CONDAsc/pip.exe"
alias plz="sudo"
alias pipreqs="$CONDAsc/pipreqs.exe"

### Applications
alias flask="$CONDAsc/flask.exe"
alias kaggle="$CONDAsc/kaggle.exe"
alias streamlit="$CONDAsc/streamlit.exe"
alias swig.exe="swig"
alias cnda="conda.exe"

### Navigation
alias wk="cd $WK"
alias dl="cd $DL"
alias me="cd $ME"
alias C="cd /mnt/c"
alias fedora="ssh reuben@$FEDORA_IP"

### Quality of life
alias path="echo \"${PATH//:/$'\n'}\""

bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

##################N
##### ZPLUG ######
##################
source ~/.zplug/init.zsh

# # Make sure to use double quotes
# zplug "zsh-users/zsh-history-substring-search"

# # Supports oh-my-zsh plugins and the like
# zplug "plugins/git",   from:oh-my-zsh



# # Set the priority when loading
# # e.g., zsh-syntax-highlighting must be loaded
# # after executing compinit command and sourcing other plugins
# # (If the defer tag is given 2 or above, run after compinit command)
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Can manage local plugins
zplug "~/.oh-my-zsh", from:local

zplug "dracula/zsh", as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load --verbose

if [ "$SSH_CONNECTION" ]; then
    PS1='(ssh) '$PS1
fi
