{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system: {
    defaultPackage =
      let
        python-overlay = (
          self: super: rec {
            python3Packages = super.python3Packages // {
              beautifulsoup4 = super.python3Packages.beautifulsoup4.overridePythonAttrs (
                _: { doCheck = false; }
              );
            };
          }
        );

        pkgs = import nixpkgs { overlays = [ python-overlay ]; inherit system; };
      in
      pkgs.python3Packages.buildPythonApplication
        {
          name = "medihunter";
          src = pkgs.lib.cleanSource ./.;
          propagatedBuildInputs = with pkgs.python3Packages; [
            click
            requests
            beautifulsoup4
            python-pushover
          ];
        };
  });
}
