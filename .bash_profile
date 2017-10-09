export PATH="$PATH:/Users/taebles/.local/bin"

# Add GHC 7.10.3 to the PATH, via https://ghcformacosx.github.io/
# export GHC_DOT_APP="/Applications/ghc-7.10.3.app"
# if [ -d "$GHC_DOT_APP" ]; then
#   export PATH="$HOME/dev/activator-1.3.12-minimal/bin:$HOME/.local/bin:$HOME/.cabal/bin:${GHC_DOT_APP}/Contents/bin:$PATH"
# fi

# export JAVA_HOME="`/usr/libexec/java_home -v 1.8`"

# better ls
alias ll="exa -l"

# Android Studio tools
# export PATH="$PATH:/Users/taebles/Library/Android/sdk/platform-tools"

# Rust and cargo
# export PATH="$PATH:$HOME/.cargo/bin"
# export RUST_SRC_PATH=$HOME/.multirust/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

# export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# Py virtualenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/local/bin/virtualenvwrapper.sh

# Ripgrep custom extensions
# elm
alias rg1="rg --type-add 'elm:*.{elm}'"
# dtl - django templates
alias rg="rg1 --type-add 'dtl:*.{dtl}'"