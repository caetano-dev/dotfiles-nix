{ pkgs, ... }:

{
  programs.firefox =
    {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        clearurls
        sponsorblock
        darkreader
        videospeed
        bitwarden
        vimium
      ];
      profiles.gabe =
        {
          settings = {
            # https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
            "gfx.webrender.all" = true;
            "media.ffvpx.enabled" = true;
            "media.ffmpeg.vaapi.enabled" = true;
            "media.navigator.mediadatadecoder_vpx_enabled" = true;
            "browser.send_pings" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "dom.event.clipboardevents.enabled" = true;
            "media.navigator.enabled" = false;
            "network.cookie.cookieBehavior" = 1;
            "network.http.referer.XOriginPolicy" = 2;
            "network.http.referer.XOriginTrimmingPolicy" = 2;
            "beacon.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "network.IDN_show_punycode" = true;
            "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
            "app.shield.optoutstudies.enabled" = false;
            "dom.security.https_only_mode_ever_enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "geo.enabled" = false;

            # Disable telemetry
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.ping-centre.telemetry" = false;
            "browser.tabs.crashReporting.sendReport" = false;
            "devtools.onboarding.telemetry.logged" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.server" = "";

            # Disable Pocket
            "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "extensions.pocket.enabled" = false;

            "svg.context-properties.content.enabled" = true;

            # Disable prefetching
            "network.dns.disablePrefetch" = true;
            "network.prefetch-next" = false;

            # Disable JS in PDFs
            "pdfjs.enableScripting" = false;

            # Harden SSL
            "security.ssl.require_safe_negotiation" = true;

            # Extra
            "identity.fxaccounts.enabled" = false;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.shortcuts.bookmarks" = false;
            "browser.urlbar.shortcuts.history" = false;
            "browser.urlbar.shortcuts.tabs" = false;
            "browser.urlbar.suggest.bookmark" = false;
            "browser.urlbar.suggest.engines" = false;
            "browser.urlbar.suggest.history" = false;
            "browser.urlbar.suggest.openpage" = false;
            "browser.urlbar.suggest.topsites" = false;
            "browser.uidensity" = 1;
            "media.autoplay.enabled" = false;
            "toolkit.zoomManager.zoomValues" = ".8,.90,.95,1,1.1,1.2";

            "privacy.firstparty.isolate" = true;
            "network.http.sendRefererHeader" = 0;
          };
          userChrome = "
            :root {
              --dark-0: #151D28;
              --dark-base: #192330;
              --dark-1: #233143;
              --dark-2: #2A3B51;
              --dark-3: #374E6C;
              --dark-4: #3E5879;
              --light-0: #D7DFEA;
              --light-base: #afc0d5;
              --light-1: #A1B5CE;
              --light-2: #94ABC7;
              --light-3: #87A0C0;
              --light-4: #7996B9;
              --accent: #63cdcf;
              --yellow: #dbc074;
              --green: #5cb8a7;
              --red: #c94f6d;
              --extension-icon-mask: grayscale(85%) invert(29%) sepia(20%) saturate(988%) hue-rotate(174deg) brightness(93%) contrast(92%);

              /* expanded width of the sidebar.
                used for userChrome-static, and hover */
              --sidebar-width: 250px;
              /* initial width of the sidebar.
                advised not to change since tst css relies on this value*/
              --sidebar-collapsed-width: 60px;

              --dividers: 2px;

              --tl-animation-duration: 200ms;
              /*--tl-tab-background-gradient: */
              /* uncomment and add gradient value for selected tab gradient*/

              /******WINDOW CONTROL PLACEMENT VARS******/
              /* larger value moves window controls down,*/
              /* can be negative(moves controls up) */
              /* 55px if tabline visible, -25px if tabline hidden */
              --wc-vertical-shift: 15px;
              --wc-left-space: 10px; /* add space to the left of window controls*/
              --wc-right-space: 15px; /* add space to the right of window controls*/
              /* left-space shifts window-controls */
              /* if you want to shift them to the left: positive value */
              /* and if you want to shift them to the right: smaller or negative value */
              /* right-space shifts rest of the navbar (forward,backward,urlbar,etc.) to the right */
              /* if you want to increase/decrease space between window-controls and navbars: */
              /* set positive/negative value for right-space*/

            }

            :root[privatebrowsingmode='temporary']{
              --dark-0: #151D28;
              --dark-base: #192330;
              --dark-1: #233143;
              --dark-2: #2A3B51;
              --dark-3: #374E6C;
              --dark-4: #3E5879;
              --light-0: #D7DFEA;
              --light-base: #afc0d5;
              --light-1: #A1B5CE;
              --light-2: #94ABC7;
              --light-3: #87A0C0;
              --light-4: #7996B9;
              --accent: #63cdcf;
              --yellow: #dbc074;
              --green: #5cb8a7;
              --red: #c94f6d;
              --extension-icon-mask: grayscale(85%) invert(29%) sepia(20%) saturate(988%) hue-rotate(174deg) brightness(93%) contrast(92%);
            }                                                                                                                                       --accent-color: 60, 56, 54;

                          ";
        };
    };
}









