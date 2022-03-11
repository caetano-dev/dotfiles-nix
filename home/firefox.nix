{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;

    profiles.gabe = {
      settings = {
        # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
        "gfx.webrender.all" = true;
        "media.ffvpx.enabled" = true;
        "media.ffmpeg.vaapi.enabled" = true;
        "media.navigator.mediadatadecoder_vpx_enabled" = true;
      };
    };

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      link-cleaner
      ublock-origin
      bitwarden
      darkreader
      videospeed
      vimium
    ];
  };
}
