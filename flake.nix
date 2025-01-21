{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      formatter.${system} = (treefmt.lib.evalModule pkgs ./treefmt.nix).config.build.wrapper;

      devShells.${system} = {
        default = pkgs.mkShell {
          packages = with pkgs; [
            nil
          ];
        };
      };

      homeManagerModules = {
        mods = import ./mods.nix;
      };
    };
}
