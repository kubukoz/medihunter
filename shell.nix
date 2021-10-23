let
  pkgs = import <nixpkgs> {};
in

pkgs.mkShell {
  buildInputs = [ pkgs.gotify-cli (import ./default.nix) ];
}
