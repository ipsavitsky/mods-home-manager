{
  outputs = {self}:{
    homeManagerModules = {
      mods = import ./mods.nix;
    };
  };
}
