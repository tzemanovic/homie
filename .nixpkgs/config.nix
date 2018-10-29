{ pkgs }:
{
  # NOTE This is now setup in nix-darwin.
  # 
  # packageOverrides = pkgs: {
  #   /* Adapted from https://alpmestan.com/posts/2017-09-06-quick-haskell-hacking-with-nix.html
  #    * Use 'nix-haskell' to try a haskell package in nix-shell. E.g.:
  #    * 'nix-haskell ghc822 protolude' to try protolude package
  #    */
  #   nix-haskell = pkgs.writeScriptBin "nix-haskell" ''
  #     #!/usr/bin/env bash
  #     if [[ $# -lt 2 ]];
  #     then
  #       echo "Must provide a ghc version (e.g ghc822) and at least one package"
  #       return 1;
  #     else
  #       ghcver=$1
  #       # get the rest of the arguments
  #       shift
  #       pkgs=$@
  #       echo "Starting haskell shell, ghc = $ghcver, pkgs = $pkgs"
  #       nix-shell -p "haskell.packages.$ghcver.ghcWithPackages (pkgs: with pkgs; [$pkgs])"
  #     fi
  #   '';

  #   /* Adapted from http://nicknovitski.com/nix-npm-install
  #    * Use 'nix-npm-install' to install a npm package. E.g.:
  #    * 'nix-npm-install tern' to install tern
  #    * 'nix-env -e node-tern' to uninstall tern
  #    */
  #   nix-npm-install = pkgs.writeScriptBin "nix-npm-install" ''
  #     #!/usr/bin/env bash
  #     tempdir="/tmp/nix-npm-install/$1"
  #     mkdir -p $tempdir
  #     pushd $tempdir
  #     # '-8' switch instructs node2nix to use nodejs 8
  #     ${pkgs.nodePackages.node2nix}/bin/node2nix -8 --input <( echo "[\"$1\"]")
  #     nix-env --install --file .
  #     popd
  #   '';
  # };
}
