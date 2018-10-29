# custom prompt
export PS1="💀 "

# Stack
export PATH="$HOME/.local/bin:$PATH"

# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
# export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
# if [ -d "$GHC_DOT_APP" ]; then
#   export PATH="$HOME/dev/activator-1.3.12-minimal/bin:$HOME/.local/bin:$HOME/.cabal/bin:${GHC_DOT_APP}/Contents/bin:$PATH"
# fi

# export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

# better ls
alias ll="exa -lF"

# Android Studio tools
# export PATH="$PATH:/Users/taebles/Library/Android/sdk/platform-tools"

# Rust and cargo
export PATH="$HOME/.cargo/bin:$PATH"
# export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export RIPGREP_CONFIG_PATH=~/.ripgreprc

alias npm-shell="nix-shell -p nodejs-9_x"

# fzf keybindings
[ -f /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash ] && source /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash
# fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

export PATH=/Users/tzemanovic/.local/bin:$PATH

# Android sdk platform tools (e.g. adb)
export PATH=/Users/tzemanovic/Library/Android/sdk/platform-tools:$PATH


# Nix-darwin work-around for nix-darwin rebuild problem:
#
# $ `darwin-rebuild changelog`
# > building the system configuration...
# > error: file 'darwin' was not found in the Nix search path (add it using $NIX_PATH or -I)
export NIX_PATH=$HOME/.nix-defexpr/channels:$NIX_PATH
# > building the system configuration...
#> error: file 'darwin-config' was not found in the Nix search path (add it using $NIX_PATH or -I), at /nix/store/6p2b7czkwg5agdcjw5p2nd2hp80rcyrj-darwin/darwin/default.nix:1:40
export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$NIX_PATH
