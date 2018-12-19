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
  # To rebuild run:
  # $ darwin-rebuild changelog
  environment.systemPackages =
    [ # my nix utils
      nix-haskell
      nix-npm-install

      # zsh
      pkgs.zsh
      pkgs.zsh-completions
      pkgs.oh-my-zsh
      pkgs.nix-zsh-completions
      pkgs.zsh-syntax-highlighting
      pkgs.zsh-autosuggestions
      # TODO powerlevel9k doesn't work - install using instructions from https://github.com/bhilburn/powerlevel9k/wiki/Install-Instructions#option-2-install-for-oh-my-zsh
      pkgs.zsh-powerlevel9k

      # nix utils
      pkgs.nix-prefetch-scripts
      pkgs.nixops
      pkgs.nixpkgs-lint

      # shell utils
      pkgs.exa
      pkgs.fd
      # pkgs.fzf
      # NOTE fzf from here didn't work properly, installed using:
      # git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
      # ~/.fzf/install
      pkgs.git
      pkgs.jq
      # TODO some build error? install with `nix-env -i pandoc`
      # pkgs.pandoc
      # TODO silver-searcher doesn't work - install with `nix-env -i silver-searcher`
      # pkgs.silver-searcher # ag
      pkgs.ripgrep
      # TODO some build error?
      # pkgs.tokei
      pkgs.vim
      pkgs.curl
      pkgs.tree
      pkgs.htop
      pkgs.rsync

      # emacs and it's layers' dependencies
      pkgs.emacsMacport
      # spell-checking
      pkgs.aspell
      pkgs.aspellDicts.cs
      pkgs.aspellDicts.en
      pkgs.aspellDicts.en-computers
      pkgs.aspellDicts.en-science
      pkgs.aspellDicts.fr

      # TODO clone gtd layer
      # cd ~/.emacs.d/private
      # git clone https://github.com/et2010/org-gtd.git gtd

      # coding
      # TODO some build error?
      # pkgs.elmPackages.elm
      pkgs.elmPackages.elm-format
      pkgs.ghc
      # TODO doesn't work - install with `nix-env -i cabal2nix`
      # pkgs.cabal2nix
      # TODO cabal-install doesn't work - install with `nix-env -i cabal-install`
      # pkgs.cabal-install
      pkgs.nodejs-10_x

      # fonts
      pkgs.powerline-fonts # used in zsh
    ];

  # powerlevel9k - https://github.com/bhilburn/powerlevel9k
  programs.zsh.promptInit = "source ${pkgs.zsh-powerlevel9k}/share/zsh-powerlevel9k/powerlevel9k.zsh-theme";

  # zsh-autosuggestions - https://github.com/NixOS/nixpkgs/blob/92a047a6c4d46a222e9c323ea85882d0a7a13af8/pkgs/shells/zsh/zsh-autosuggestions/default.nix#L3
  # TODO > error: The option `programs.zsh.enableAutoSuggestions' defined in `/Users/tzemanovic/.nixpkgs/darwin-configuration.nix' does not exist.
  # programs.zsh.enableAutoSuggestions = true;

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
