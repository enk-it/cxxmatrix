{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }: let
    pkgs = import nixpkgs { system = "x86_64-linux"; };
  in {
    packages.x86_64-linux.default = pkgs.callPackage ./package.nix {};
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [ pkgs.gawk ];
    };
  };
}
