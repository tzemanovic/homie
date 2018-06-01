{
  packageOverrides = super: {
    /* From http://nicknovitski.com/nix-npm-install
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
  };
}