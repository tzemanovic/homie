{ config, pkgs, ... }:
let
    inherit (pkgs) aspellWithDicts;

    my-aspell = aspellWithDicts (d: [
      d.en
      d.cs
      d.en-computers
      d.en-science
      d.fr
    ]);

    /* Adapted from https://alpmestan.com/posts/2017-09-06-quick-haskell-hacking-with-nix.html
     * Use 'nix-haskell' to try a haskell package in nix-shell. E.g.:
     * 'nix-haskell ghc822 protolude' to try protolude package
     */
    nix-haskell = pkgs.writeScriptBin "nix-haskell" ''
      #!/usr/bin/env bash
      if [[ $# -lt 2 ]];
      then
        echo "Must provide a ghc version (e.g ghc822) and at least one package"
        return 1;
      else
        ghcver=$1
        # get the rest of the arguments
        shift
        pkgs=$@
        echo "Starting haskell shell, ghc = $ghcver, pkgs = $pkgs"
        nix-shell -p "haskell.packages.$ghcver.ghcWithPackages (pkgs: with pkgs; [$pkgs])"
      fi
    '';

    /* Adapted from http://nicknovitski.com/nix-npm-install
     * Use 'nix-npm-install' to install a npm package. E.g.:
     * 'nix-npm-install tern' to install tern
     * 'nix-env -e node-tern' to uninstall tern
     */
    nix-npm-install = pkgs.writeScriptBin "nix-npm-install" ''
      #!/usr/bin/env bash
      tempdir="/tmp/nix-npm-install/$1"
      mkdir -p $tempdir
      pushd $tempdir
      ${pkgs.nodePackages.node2nix}/bin/node2nix --nodejs-10 --input <( echo "[\"$1\"]")
      nix-env --install --file .
      popd
    '';
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # To rebuild run:
  # $ darwin-rebuild changelog
  environment.systemPackages =
    (with pkgs; [
      # zsh
      zsh
      zsh-completions
      oh-my-zsh
      nix-zsh-completions
      zsh-syntax-highlighting
      zsh-autosuggestions
      zsh-powerlevel10k
      alacritty

      # nix utils
      nix-prefetch-scripts
      nixops
      nixpkgs-lint

      # shell utils
      tmux
      exa
      fd
      fzf
      git
      jq
      pandoc
      silver-searcher # ag
      ripgrep
      tokei
      vim
      curl
      tree
      htop
      rsync
      rename
      bat

      # emacs and it's layers' dependencies
      emacsMacport
      # spell-checking
      my-aspell

      # TODO clone gtd layer
      # cd ~/.emacs.d/private
      # git clone https://github.com/et2010/org-gtd.git gtd

      # Elm
      elmPackages.elm
      elmPackages.elm-format
      elmPackages.elm-live
      elmPackages.elm-language-server
      elmPackages.elm-test
      elm2nix

      # Haskell
      ghc
      cabal2nix
      cabal-install

      # Rust
      rustup

      # Scala
      sbt
      scala

      # Node
      nodejs-10_x
      nodePackages.node2nix

      # JS
      # nodePackages.brunch
      nodePackages.prettier
      nodePackages.uglify-js

      # fonts
      powerline-fonts # used in zsh

      # my nix utils
      nix-haskell
      nix-npm-install
    ]);

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.package = pkgs.nix;

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.bash.enable = true;
  programs.zsh.enable = true;
  # programs.fish.enable = true;

  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  # programs.zsh.autosuggestions.enable = true;
  # programs.zsh.enableSyntaxHighlighting = true;
  # programs.zsh.ohMyZsh.enable = true;
  # programs.zsh.ohMyZsh.plugins = [ "extract" "fzf" "git" "tmux" "vi-mode" ];

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 3;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;

  # obelisk caches
  nix.binaryCaches = [ "https://cache.nixos.org/" "https://nixcache.reflex-frp.org" ];
  nix.binaryCachePublicKeys = [ "ryantrinkle.com-1:JJiAKaRv9mWgpVAz8dwewnZe0AzzEAzPkagE9SP5NWI=" ];
}
