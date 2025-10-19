# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="maran"
ZSH_THEME="obraun"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sublime docker docker-compose vscode zsh-autosuggestions zsh-syntax-highlighting npm sudo command-not-found z zsh-interactive-cd zsh-navigation-tools colorize)

# plugins=(git sublime docker docker-compose vscode web-search zsh-autosuggestions zsh-syntax-highlighting npm sudo command-not-found z zsh-interactive-cd zsh-navigation-tools colorize)

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
alias lab='ssh lab'
alias cls='clear'
alias dps='docker ps'
alias dcla='docker container ls -a'
alias ndl='docker ps -f name=microservice -q |xargs -L 1 docker logs -f'
alias kd='kubectl.docker'
alias ls='lsd'
alias gs='git status'
alias gsws='git switch $(git_staging_branch)'
alias hgp='git -C ~/tools/holmes pull;git -C ~/GDrive/source/holmes pull'
alias hp='gswm;gl;gsws;gl;gswd;gl'
alias ha="cd /Users/${USER}/dev/holmes-api"
alias hu="cd /Users/${USER}/dev/holmes-ui"
alias j17='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.0.16/Contents/Home'
alias j11='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.28/Contents/Home'
alias py='python3'
alias neb='atlas nebulae'

# Additional Function to OMZ Git plugin for staging branch
function git_staging_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in stg staging stag; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return 0
    fi
  done

  echo staging
  return 1
}

# Command Completion 
#fpath=(~/.zsh/completion $fpath)
#autoload -Uz compinit
#compinit -i

# Java Home Path
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-11.0.28/Contents/Home"

# Locale settings
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Starship
eval "$(starship init zsh)"

# Color tabs
function tabcolor {
  echo -n -e "\033]6;1;bg;red;brightness;$1\a"
  echo -n -e "\033]6;1;bg;green;brightness;$2\a"
  echo -n -e "\033]6;1;bg;blue;brightness;$3\a"
}
tabcolor $(jot -r 1 0 255) $(jot -r 1 0 255) $(jot -r 1 0 255)

export PATH="$PATH:/Users/${USER}/perl5/bin${PATH:+:${PATH}}:$JAVA_HOME/bin"

#export PATH;
PERL5LIB="/Users/${USER}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/${USER}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/${USER}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/${USER}/perl5"; export PERL_MM_OPT;
OBJC_DISABLE_INITIALIZE_FORK_SAFETY="YES"; export OBJC_DISABLE_INITIALIZE_FORK_SAFETY;

export PATH="/Users/${USER}/.orbit/bin:$PATH"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
#fpath=(/Users/${USER}/.docker/completions $fpath)
#autoload -Uz compinit
#compinit
# End of Docker CLI completions
