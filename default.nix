let
  overlay = (
    self: super: rec {
      python3Packages = super.python3Packages // {
        beautifulsoup4 = super.python3Packages.beautifulsoup4.overridePythonAttrs (
          _: { doCheck = false; }
        );
      };
    }
  );

  pkgs = import <nixpkgs> { overlays = [ overlay ]; };
  inherit (pkgs) python3Packages;
in
python3Packages.buildPythonApplication {
  name = "medihunter";
  src = pkgs.lib.cleanSource ./.;
  propagatedBuildInputs = with pkgs.python3Packages; [
    click
    requests
    beautifulsoup4
    python-pushover
  ];
}
