# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/tz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

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

export FZF_BASE=/usr/local/opt/fzf

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    extract
    fzf
    git
    tmux
    vi-mode
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

# Nix
. /Users/tz/.nix-profile/etc/profile.d/nix.sh

# Nix-darwin work-around for nix-darwin rebuild problem:
#
# $ `darwin-rebuild changelog`
# > building the system configuration...
# > error: file 'darwin' was not found in the Nix search path (add it using $NIX_PATH or -I)
#export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
# > building the system configuration...
#> error: file 'darwin-config' was not found in the Nix search path (add it using $NIX_PATH or -I), at /nix/store/6p2b7czkwg5agdcjw5p2nd2hp80rcyrj-darwin/darwin/default.nix:1:40
#export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$NIX_PATH

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Stack
export PATH="$HOME/.local/bin:$PATH"

# better ls
alias ll="exa -lF"

# Rust Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# ripgrep config
export RIPGREP_CONFIG_PATH=~/.ripgreprc

alias npm-shell="nix-shell -p nodejs-10_x"

# fzf keybindings
[ -f /nix/store/cpwjpi75mln2knpb6vdmflblsfyywv4h-fzf-0.18.0/share/fzf/key-bindings.zsh ] && source /nix/store/cpwjpi75mln2knpb6vdmflblsfyywv4h-fzf-0.18.0/share/fzf/key-bindings.zsh
[ -f /nix/store/cpwjpi75mln2knpb6vdmflblsfyywv4h-fzf-0.18.0/share/fzf/completion.zsh ] && source /nix/store/cpwjpi75mln2knpb6vdmflblsfyywv4h-fzf-0.18.0/share/fzf/completion.zsh
# fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# install from https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
POWERLEVEL9K_MODE='nerdfont-complete'
# using with tango dark theme in iterm2

# opam configuration
test -r /Users/tz/.opam/opam-init/init.zsh && . /Users/tz/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Tezos
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NPM
export PATH="$HOME/mutable_node_modules/bin:$PATH"
