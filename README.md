# Mods `home-manager` flake

This flake exposes a home manager module that is used to configure [charmbracelet/mods](https://github.com/charmbracelet/mods).

## Example
To add configuration to your config:
``` nix
{
  inputs = {
    mods.url = "github:ipsavitsky/mods-home-manager";
  };

  outputs = { mods, home-manager, ... }: {
    homeConfigurations.ilya = {
      # ...
      modules = [
        mods.homeManagerModules.mods
      ];
    };
  };
}
```

To configure the module:
``` nix
{ ... }:
{
  programs.mods = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      default-model = "llama3.2";
      apis = {
        ollama = {
          base-url = "http://localhost:11434/api";
          models = {
            "llama3.2" = {
              max-input-chars = 650000;
            };
          };
        };
      };
    };
  };
}
```
