{ nixpkgs ? <nixpkgs> }:

with import nixpkgs {};

import (runCommand "bootstrap.nix-generated" {
  buildInputs = [ emacs ];
} ''
    mkdir -p $out
    cd $out
    # cp ${./test.org} test.org
    emacs --batch -l ob-tangle --eval "(org-babel-tangle-file \"${./README.org}\")"
    # cp bootstrap.nix default.nix
  ''
) { inherit nixpkgs; }
