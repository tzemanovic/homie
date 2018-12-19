# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tzemanovic/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel9k/powerlevel9k"

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

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
  git
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# Stack
export PATH="$HOME/.local/bin:$PATH"


# better ls
alias ll="exa -lF"


# Android Studio tools
export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"


# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"


# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"


# ripgrep config
export RIPGREP_CONFIG_PATH=~/.ripgreprc


alias npm-shell="nix-shell -p nodejs-10_x"


# fzf keybindings
[ -f /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash ] && source /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash
# fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'


# Nix-darwin work-around for nix-darwin rebuild problem:
#
# $ `darwin-rebuild changelog`
# > building the system configuration...
# > error: file 'darwin' was not found in the Nix search path (add it using $NIX_PATH or -I)
export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
# > building the system configuration...
#> error: file 'darwin-config' was not found in the Nix search path (add it using $NIX_PATH or -I), at /nix/store/6p2b7czkwg5agdcjw5p2nd2hp80rcyrj-darwin/darwin/default.nix:1:40
export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$NIX_PATH


# install from https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
POWERLEVEL9K_MODE='nerdfont-complete'
# using with tango dark theme in iterm2


# Nix
. /Users/tzemanovic/.nix-profile/etc/profile.d/nix.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:
