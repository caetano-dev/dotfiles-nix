{ lib, pkgs, ... }:
{
services.picom = {
    enable = true;
    inactiveOpacity = 0.9;
    activeOpacity = 1.0;
    experimentalBackends = true;
    settings = {
      blur = {
      method = "dual_kawase";
      strength = 8;
      deviation = 8;
      };
  };
    fade = true;
    fadeDelta = 4;
  };
}
