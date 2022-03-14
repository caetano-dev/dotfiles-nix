{ pkgs, ... }:

let
  w3m = "${pkgs.w3m}/bin/w3m";
  mpv = "${pkgs.mpv}/bin/mpv";
in
{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        title = "The Go Programming Language Blog";
        url = "https://go.dev/blog/feed.atom?format=xml";
        tags = [ "tech" "go" ];
      }

      # Aggregators
      {
        title = "Lobste.rs - Personalized";
        url = "https://lobste.rs/t/nix,go,linux,privacy.rss";
        tags = [ "tech" "go" "nix" "linux" "privacy"];
      }
      {
        title = "Lobste.rs - Frontpage";
        url = "https://lobste.rs/rss";
        tags = [ "tech" ];
      }
      {
        title = "Hacker News - Personalized";
        url = "https://hnrss.org/newest?q=go+OR+privacy+OR+linux+cia+breach+data+leak+hack";
        tags = [ "tech" "go" "open-source" "linux" "privacy" "breach" "data" "leak" "hack"];
      }
      {
        title = "Hacker News - Frontpage";
        url = "https://news.ycombinator.com/rss";
        tags = [ "tech" ];
      }
    ];
    extraConfig = ''
      html-renderer      "${w3m} -dump -T text/html"
      refresh-on-startup yes
      text-width         72
      # open video on mpv
      macro v set browser "${mpv} %u" ; open-in-browser ; set browser "${w3m} %u"
    '';
  };
}