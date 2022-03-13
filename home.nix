{ pkgs, inputs, ... }:

{
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  home-manager.users.gabe = {
    imports = [
      ./home/bash.nix
      ./home/fish.nix
      ./home/firefox.nix
      ./home/newsboat.nix
      ./home/git.nix
      ./home/i3.nix
      ./home/kitty.nix
      ./home/nvim.nix
      ./home/rbw.nix
      ./home/starship.nix
      ./home/vscode.nix
      ./modules/meta.nix

      inputs.nix-colors.homeManagerModule
    ];

    colorscheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-medium;

    programs.home-manager.enable = true;

    home.username = "gabe";
    home.homeDirectory = "/home/gabe";
    home.packages = with pkgs; [
      # gui
      vlc
      mpv
      krita
      zathura
      xfce.thunar
      flameshot

      # online chat
      discord

      # dev
      tdesktop
      ripgrep
      obsidian
      qbittorrent
      fd

      # cli
      feh
      bottom
      ffmpeg
      pulseaudio
      gnumake
      lm_sensors
      maim
      xclip
      protonvpn-cli

      # nix
      rnix-lsp
      nixpkgs-fmt
    ];

    home.sessionVariables = {
      VISUAL = "nvim";
      EDITOR = "nvim";
    };

    home.stateVersion = "21.05";
  };
}
