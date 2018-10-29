# { config, pkgs, ... }:

let
    pkgs = import <nixpkgs> {};

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
      # '-8' switch instructs node2nix to use nodejs 8
      ${pkgs.nodePackages.node2nix}/bin/node2nix -8 --input <( echo "[\"$1\"]")
      nix-env --install --file .
      popd
    '';
in
{
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =
    [ # my nix utils
      nix-haskell
      nix-npm-install

      # shell
      pkgs.zsh
      pkgs.zsh-completions

      # nix utils
      pkgs.nix-prefetch-scripts
      pkgs.nixops
      pkgs.nixpkgs-lint

      # shell utils
      pkgs.vim
      pkgs.exa
      pkgs.fzf
      pkgs.git
      pkgs.pandoc
      pkgs.ripgrep
      pkgs.tokei
      pkgs.jq

      # emacs and it's layers' deps
      pkgs.emacs25Macport
      # spell-checking
      pkgs.aspell
      pkgs.aspellDicts.cs
      pkgs.aspellDicts.en
      pkgs.aspellDicts.en-computers
      pkgs.aspellDicts.en-science
      pkgs.aspellDicts.fr

      # coding
      pkgs.elmPackages.elm
      pkgs.elmPackages.elm-format
      pkgs.nodejs-8_x
    ];

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

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 3;

  # You should generally set this to the total number of logical cores in your system.
  # $ sysctl -n hw.ncpu
  nix.maxJobs = 8;
  nix.buildCores = 8;
}
