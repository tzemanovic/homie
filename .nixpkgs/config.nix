{
  packageOverrides = super: {
    /* Adapted from http://nicknovitski.com/nix-npm-install
     * Use 'nix-npm-install' to install a npm package. E.g.:
     * 'nix-env -i nix-npm-install' to install this script
     * 'nix-npm-install tern' to install tern
     * 'nix-env -e node-tern' to uninstall tern
     */
    nix-npm-install = super.pkgs.writeScriptBin "nix-npm-install" ''
      #!/usr/bin/env bash
      tempdir="/tmp/nix-npm-install/$1"
      mkdir -p $tempdir
      pushd $tempdir
      # '-8' switch instructs node2nix to use nodejs 8
      ${super.nodePackages.node2nix}/bin/node2nix -8 --input <( echo "[\"$1\"]")
      nix-env --install --file .
      popd
    '';

    /* Adapted from https://alpmestan.com/posts/2017-09-06-quick-haskell-hacking-with-nix.html
     * Use 'nix-haskell' to try a haskell package in nix-shell. E.g.:
     * 'nix-env -i nix-haskell' to install this script
     * 'nix-haskell ghc822 protolude' to try protolude package
     */
    nix-haskell = super.pkgs.writeScriptBin "nix-haskell" ''
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
  };
}
