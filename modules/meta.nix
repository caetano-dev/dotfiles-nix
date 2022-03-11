{ lib, pkgs, ... }:

with pkgs.lib;

{
  options.meta = {
    username = mkOption {
      type = types.str;
      default = "gabe";
      description = "The default username";
    };

    email = mkOption {
      type = types.str;
      default = "pcaetanop@protonmail.com";
      description = "The default email";
    };

    name = mkOption {
      type = types.str;
      default = "gabe";
      description = "The default name";
    };
  };
}
