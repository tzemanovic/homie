# custom prompt
export PS1="\[☠️\]  \w\nλ "

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

# Rust and cargo# export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# Postgres
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# Py virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/local/bin/virtualenvwrapper.sh

# Better `history`
shopt -s histappend
export HISTIGNORE=pwd:exit:mc:su:df:clear:ps:h:history
export HISTCONTROL=erasedups:ignoreboth
export PROMPT_COMMAND='history -a'

export RIPGREP_CONFIG_PATH=~/.ripgreprc

alias npm-shell="nix-shell -p nodejs-9_x"

# fzf keybindings
[ -f /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash ] && source /nix/store/l5jwsdxkswm1zlxfkm5wjqfi3jlf097c-fzf-0.17.3-bin/share/fzf/key-bindings.bash
# fzf use ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'

# Android sdk platform tools (e.g. adb)
export PATH=/Users/tzemanovic/Library/Android/sdk/platform-tools:$PATH
if [ -e /Users/tzemanovic/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/tzemanovic/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
