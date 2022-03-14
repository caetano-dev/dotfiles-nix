{ pkgs, ... }:

{
  programs.firefox =
    {
      enable = true;
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        clearurls
        darkreader
        videospeed
        bitwarden
        vimium
        sidebery
        # add the scrollanywhere extension
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
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_ever_enabled" = true;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "browser.toolbars.bookmarks.visibility" = "never";
            "geo.enabled" = false;

            # Disable telemetry
            "browser.ping-centre.telemetry" = false;
            "browser.tabs.crashReporting.sendReport" = false;
            "devtools.onboarding.telemetry.logged" = false;
            "toolkit.telemetry.server" = "";
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;

            # As well as Firefox 'experiments'
            "experiments.activeExperiment" = false;
            "experiments.enabled" = false;
            "experiments.supported" = false;
            "network.allow-experiments" = false;

            # Disable Pocket
            "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
            "browser.newtabpage.activity-stream.showSponsored" = false;
            "extensions.pocket.enabled" = false;
            "extensions.pocket.api" = "";
            "extensions.pocket.oAuthConsumerKey" = "";
            "extensions.pocket.showHome" = false;
            "extensions.pocket.site" = "";

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

            # Privacy settings
            "privacy.donottrackheader.enabled" = true;
            "privacy.trackingprotection.enabled" = true;
            "privacy.trackingprotection.socialtracking.enabled" = true;
            "privacy.partition.network_state.ocsp_cache" = true;
            "privacy.firstparty.isolate" = true;
            "network.http.sendRefererHeader" = 0;
          };
          userChrome = ''
            /*Question: WHY THE FUCK DOESN'T MY BROWSER HAVE TABS AND A SCROLLBAR? */

            /*Answer: you need to use the sidebery and scroolanywhere extensions.
            or you can delete the css below.*/

            /* to hide the native tabs */
            #TabsToolbar {
            visibility: collapse !important;
            }

            /* to hide the sidebar header */
            #sidebar-header {
            visibility: collapse !important;
            display: none !important;
            }
            #sidebar-header {
            visibility: collapse !important
            }
            #customization-footer button,
            #editBookmarkPanelBottomButtons button {
            -moz-appearance: none !important;
            border: none !important;
            padding: 7px !important;
            color: var(--arrowpanel-color) !important;
            background: var(--arrowpanel-background) !important;
            border-radius: 5px !important;
            margin-left: 10px !important;
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05) !important;
            transition: transform 300ms ease-in-out !important;
            }

            #editBookmarkPanelBottomButtons button,
            #editBMPanel_foldersExpander button {
            background: var(--lwt-accent-color) !important;
            }
            button#editBookmarkPanelDoneButton {
            color: var(--lwt-accent-color) !important;
            background-color: var(--lwt-toolbarbutton-icon-fill-attention) !important;
            }

            button:hover {
            transform: translateY(-2px) !important;
            }

            #editBookmarkPanel input {
            -moz-appearance: none !important;
            border-radius: 5px;
            padding: 7px;
            background: var(--lwt-accent-color) !important;
            background-color: var(--lwt-accent-color) !important;
            border-color: var(--arrowpanel-dimmed-further) !important;
            }
            *{transition: all 0.2s ease-in-out !important;}

            /*NAVBAR*/

            .titlebar-spacer {
            display: none !important;
            }

            toolbox#navigator-toolbox {
            border-bottom: solid var(--dividers) var(--sidebar-shadow-color) !important;
            }

            #nav-bar {
            min-height: 36px !important;
            box-shadow: none !important;
            padding-inline: 5px 6px !important;
            background-color: var(--toolbar-bgcolor) !important;
            padding: 8px !important;
            }

            .private-browsing-indicator {
            display: none !important;
            }

            #reload-button[disabled]:not(:-moz-window-inactive) > .toolbarbutton-icon {
            opacity: 1 !important;
            }

            toolbar .toolbarbutton-1 {
            margin-left: 3px !important;
            margin-right: 3px !important;
            }

            #stop-reload-button[animate="true"] .toolbarbutton-animatable-box {
            transform: translateX(2px) translateY(16px) !important;
            }

            .toolbarbutton-1[checked="true"] > .toolbarbutton-icon {
            background: transparent !important;
            fill: var(--lwt-toolbarbutton-icon-fill-attention);
            }

            toolbar .toolbarbutton-1 > .toolbarbutton-icon {
            border-radius: 7px !important;
            padding: 7px !important;
            }

            :root:not([customizing]) #back-button[disabled="true"] {
            opacity: 0.5 !important;
            }

            #back-button:not(:hover),
            #back-button:not(:hover) > .toolbarbutton-icon {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
            }

            #back-button:hover,
            #back-button:hover > .toolbarbutton-icon {
            background: transparent !important;
            border: none !important;
            box-shadow: none !important;
            border: none !important;
            }

            #back-button:hover:not([disabled]) > .toolbarbutton-icon {
            background: var(--lwt-toolbarbutton-hover-background) !important;
            }

            #back-button > .toolbarbutton-icon {
            padding: 4px !important;
            }
            #forward-button > .toolbarbutton-icon {
            padding: 3px !important;
            }
            toolbar:not([customizing="true"])
            .toolbarbutton-1:not(.titlebar-button):not(#back-button):not(#forward-button)
            > .toolbarbutton-icon {
            padding: 6px !important;
            }
            .toolbarbutton-1 .toolbarbutton-badge-stack #fxa-avatar-image {
            padding: 1px !important;
            }

            /* Windows */
            #PanelUI-button {
            border: none !important;
            margin: 0 !important;
            padding: 0 !important;
            }

            #PanelUI-menu-button[badge-status|="update"] .toolbarbutton-badge {
            display: none !important;
            }

            :root[privatebrowsingmode] #fxa-toolbar-menu-button {
            pointer-events: none !important;
            }

            /* show "Private" label for en languages only */
            :root[titlemodifier="(Private Browsing)"] #fxa-toolbar-menu-button::before {
            content: "Private" !important;
            display: -moz-box !important;
            margin-inline-start: 12px !important;
            margin-inline-end: 6px !important;
            }

            #nav-bar-customization-target {
            overflow: visible !important;
            }

            .toolbarbutton-animatable-box {
            transform: translateX(-80px) !important;
            top: 1px !important;
            z-index: 10 !important;
            }

            #PersonalToolbar {
            margin-top: -40px !important;
            opacity: 0;
            transition: all var(--transition-time) var(--ease-out) !important;
            }

            toolbox[id="navigator-toolbox"]:hover #PersonalToolbar {
            opacity: 1;
            margin: 0 !important;
            }

            #PlacesToolbarItems {
            margin: 7px 4px !important;
            }

            toolbarbutton[class="bookmark-item"]:not(:hover) {
            opacity: 0.6 !important;
            }

            /*URL BAR*/

            .urlbarView-body-inner {
            border: 0 !important;
            }

            .urlbarView-row {
            padding: 0 !important;
            border-radius: 0 !important;
            }

            .urlbarView-row:hover,
            .urlbarView-row-inner:hover {
            background: var(--lwt-accent-color) !important;
            background-color: var(--lwt-accent-color) !important;
            }

            .urlbarView-row-inner {
            align-items: center !important;
            position: relative !important;
            padding: 12px 0 !important;
            padding-inline: 48px 16px !important;
            max-width: 100% !important;
            width: auto !important;
            }

            .urlbarView-no-wrap {
            height: 100% !important;
            align-items: center !important;
            margin-inline-start: 0 !important;
            max-width: 100% !important;
            }

            .urlbarView-row[has-url][type]:not([type="bookmark"]) .urlbarView-row-inner {
            flex-direction: column !important;
            align-items: flex-start !important;
            }

            .urlbarView-row[has-url][type]:not([type="bookmark"]) .urlbarView-no-wrap {
            height: auto !important;
            align-self: flex-start !important;
            width: 100% !important;
            }

            .urlbarView-title-separator {
            visibility: visible !important;
            }

            .urlbarView-title-separator::before {
            content: "-" !important;
            color: inherit !important;
            }

            .urlbarView-title-separator,
            .urlbarView-action {
            opacity: 0.6 !important;
            color: inherit !important;
            font-size: revert !important;
            }

            .urlbarView-favicon {
            position: absolute !important;
            left: 16px !important;
            top: 50% !important;
            transform: translateY(-50%) !important;
            fill-opacity: 0.6 !important;
            flex: unset !important;
            margin: unset !important;
            }

            .urlbarView-title,
            .urlbarView-url {
            text-overflow: ellipsis !important;
            mask-image: none !important;
            }

            .urlbarView-title {
            color: var(--urlbarView-popup-title) !important;
            flex: 1 !important;
            flex-basis: unset !important;
            }

            .urlbarView-url {
            max-width: 100% !important;
            font-size: revert !important;
            color: var(--urlbarView-popup-url) !important;
            padding: 0 !important;
            }

            .urlbarView-url:not(:empty) {
            visibility: visible !important;
            }

            .urlbarView-action:not(:empty) {
            display: flex !important;
            }

            .urlbarView-row[type="search"] ~ .urlbarView-row[type="search"] .urlbarView-title-separator,
            .urlbarView-row[type="search"] ~ .urlbarView-row[type="search"] .urlbarView-action,
            .urlbarView-row[has-url][type]:not([type="bookmark"]) .urlbarView-title-separator,
            .urlbarView-type-icon {
            display: none !important;
            }

            .urlbarView-row[type="tip"] > .urlbarView-row-inner > .urlbarView-favicon,
            .urlbarView-row[type="tip"] > .urlbarView-row-inner > .urlbarView-title,
            .urlbarView-tip-button,
            .urlbarView-tip-help {
            margin-block-end: 0 !important;
            }

            .urlbarView .search-one-offs {
            padding: 4px !important;
            display: none !important;
            }

            .urlbarView .search-panel-one-offs-header {
            margin-inline-start: 12px !important;
            line-height: 40px !important;
            transform: translateY(-1px) !important;
            }

            .urlbarView .search-panel-one-offs {
            border-radius: 0 0 8px 8px !important;
            display: inline-flex !important;
            flex-direction: row !important;
            padding: 0 !important;
            margin: 0 !important;
            float: left !important;
            max-width: none !important;
            height: auto !important;
            }

            .urlbarView .searchbar-engine-one-off-item {
            height: 32px !important;
            border-radius: 16px !important;
            padding: 0 8px !important;
            margin: 4px !important;
            background-image: none !important;
            color: inherit !important;
            border: 0 !important;
            }

            #urlbar-container {
            max-height: 36px !important;
            }

            #urlbar,
            #searchbar {
            font-size: 13px !important;
            border-radius: 20px !important;
            background-color: var(--toolbar-field-background-color) !important;
            border: 0 !important;
            box-shadow: none !important;
            padding: 0px !important;
            background-clip: padding-box !important;
            text-align: center;
            transition: background-color 0.1s var(--ease-basic);
            -moz-box-align: center !important;
            display: block !important;
            margin: 0 !important;
            top: 0px !important;
            color: inherit !important;
            block-size: border-block !important;

            --urlbar-height: 32px !important;

            min-height: var(--urlbar-height) !important;
            }

            #urlbar:not(:-moz-lwtheme),
            #searchbar:not(:-moz-lwtheme) {
            color: inherit !important;
            }

            #urlbar[focused],
            #urlbar[open],
            #searchbar[focused],
            #searchbar[open] {
            text-align: left;
            background-color: var(--toolbar-field-focus-background-color) !important;
            }

            #urlbar[focused],
            #searchbar[focused] {
            border: 2px solid var(--toolbar-field-focus-border-color) !important;
            padding: 0 !important;
            margin: 0 !important;
            }

            /* if only focused, don't break out the urlbar */
            #urlbar[focused]:not([open]) {
            width: 100% !important;
            left: 0 !important;
            right: 0 !important;
            }

            #urlbar[open],
            #searchbar[open] {
            border: 0 !important;
            padding: 0 !important;
            border-radius: 8px !important;
            min-height: 40px !important;
            margin: -4px 0 -1px !important;
            box-shadow: 5px 4px 16px -10px rgba(0, 0, 0, 0.2), -5px 4px 16px -10px rgba(0, 0, 0, 0.2),
            0 8px 32px -16px rgba(0, 0, 0, 0.6) !important;
            z-index: 99999 !important;
            }

            /* 71+ */
            #urlbar-background {
            display: none !important;
            }

            #urlbar-input-container,
            #searchbar {
            display: flex !important;
            align-items: center !important;
            }

            #urlbar-input-container {
            height: auto !important;
            padding: 0 !important;
            border: 0 !important;
            margin-top: 2px !important;
            }

            .urlbar-input-box,
            .searchbar-textbox {
            flex: 1 !important;
            }

            #urlbar-input {
            width: 100% !important;
            }

            #urlbar-input,
            .searchbar-textbox {
            color: var(--lwt-toolbar-field-color) !important;
            }

            #urlbar-input::placeholder,
            .searchbar-textbox::placeholder {
            opacity: 0.5 !important;
            }

            #urlbar[open] #urlbar-input-container {
            height: 40px !important;
            }

            #urlbar[open] #identity-box {
            margin-inline-start: 8px !important;
            margin-inline-end: 8px !important;
            }

            .urlbarView {
            top: 0 !important;
            left: 0 !important;
            right: 0 !important;
            position: relative !important;
            box-shadow: none !important;
            border: 0 !important;
            background: 0 !important;
            margin: 0 !important;
            }

            #urlbar[open] .urlbarView {
            display: block !important;
            width: 100% !important;
            }

            #urlbar-results {
            padding: 0 !important;
            }

            #urlbar-container,
            #searchbar-container {
            overflow: visible !important;
            padding: 0 !important;
            margin-inline: 6px !important;
            }

            #identity-icon {
            fill-opacity: 1 !important;
            }

            #identity-icon-labels {
            color: inherit !important;
            opacity: 1 !important;
            padding: 0 !important;
            margin-inline-start: 8px !important;
            margin-block-start: -1px !important;
            display: none !important;
            align-items: center !important;
            }

            #identity-box {
            display: flex !important;
            position: relative !important;
            }

            #urlbar-label-box {
            border: 0 !important;
            padding: 0 !important;
            }

            /* separator */
            #identity-icon-labels::after {
            content: "" !important;
            display: block !important;
            position: absolute !important;
            height: 16px !important;
            right: 0 !important;
            background: #9d9e9f !important;
            width: 1px !important;
            transition: opacity 0.2s var(--ease-basic) !important;
            }

            #urlbar[pageproxystate="valid"]:not([open])
            #identity-box:-moz-any(.notSecureText, .verifiedIdentity, .chromeUI, .extensionPage, .certUserOverridden),
            #urlbar-label-box {
            margin-inline-end: 8px !important;
            }

            #urlbar[pageproxystate="valid"]:not([open])
            #identity-box:-moz-any(.notSecureText, .verifiedIdentity, .chromeUI, .extensionPage, .certUserOverridden)
            #identity-icon-labels {
            display: flex !important;
            }

            #urlbar[pageproxystate="valid"]
            #identity-box:-moz-any(.notSecureText, .verifiedIdentity, .chromeUI, .extensionPage, .certUserOverridden):not(.no-hover):-moz-any([open], :hover)
            #identity-icon-labels::after {
            opacity: 0 !important;
            }

            #urlbar[pageproxystate="valid"] #identity-box.extensionPage > #identity-icon {
            list-style-image: none !important;
            margin-inline-end: -16px !important;
            }

            /* no longer used as a connection icon */
            #connection-icon {
            display: none !important;
            }

            #urlbar[pageproxystate="valid"]
            #identity-box:-moz-any(.mixedActiveBlocked, .mixedDisplayContentLoadedActiveBlocked, .mixedActiveContent)
            > #connection-icon {
            display: -moz-box !important;
            }

            #urlbar[pageproxystate="valid"]
            #identity-box:-moz-any(.weakCipher, .certUserOverridden, .certErrorPage, .insecureLoginForms, .mixedActiveContent) {
            color: #c94031 !important;
            }

            .urlbar-input {
            padding: 0 !important;
            }

            .searchbar-textbox {
            border: 0 !important;
            background: 0 !important;
            box-shadow: none !important;
            margin: 0 !important;
            -moz-appearance: none !important;
            }

            .searchbar-search-icon {
            margin: 0 !important;
            fill-opacity: 1 !important;
            }

            .searchbar-search-icon-overlay {
            margin-inline-start: -11px !important;
            margin-inline-end: 0 !important;

            /* not really useful anyway */
            display: none !important;
            }

            #page-action-buttons > #pageActionSeparator,
            .urlbar-history-dropmarker {
            display: none !important;
            }

            #pageActionSeparator {
            height: 24px !important;
            }

            .urlbar-icon-wrapper {
            background: 0 !important;
            }

            .urlbar-icon,
            #page-action-buttons > toolbarbutton,
            .searchbar-search-button,
            #identity-box,
            #tracking-protection-icon-box {
            min-width: 24px !important;
            height: 24px !important;
            padding: 4px !important;
            margin: 0 2px !important;
            border: 0 !important;
            border-radius: 7px !important;
            fill-opacity: 1 !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            transition: background-color 0.2s var(--ease-basic) !important;
            background: 0 !important;
            background-color: transparent !important;
            }

            #tracking-protection-icon-container {
            background: 0 !important;
            border: 0 !important;
            margin: 0 !important;
            padding: 0 !important;
            width: auto !important;
            order: 97 !important;
            }

            #tracking-protection-icon-box {
            display: block !important;
            width: 24px !important;
            }

            #tracking-protection-icon-box {
            transition: background-color 0.2s var(--ease-basic), width 0.15s var(--ease-in), opacity 0.15s var(--ease-basic),
            visibility 0s 0.2s !important;
            opacity: 0 !important;
            visibility: hidden !important;
            width: 0 !important;
            }

            #urlbar:hover #tracking-protection-icon-box,
            #tracking-protection-icon-container[open] #tracking-protection-icon-box,
            #tracking-protection-icon-box[active] {
            transition: background-color 0.2s var(--ease-basic), width 0.3s var(--ease-out), opacity 0.3s var(--ease-basic) !important;
            opacity: 1 !important;
            visibility: visible !important;
            padding-left: 6px !important;
            width: 28px !important;
            }

            #tracking-protection-icon {
            display: block !important;
            }

            #tracking-protection-icon-animatable-box {
            display: none !important;
            }

            #identity-box #notification-popup-box {
            padding: 0 !important;
            margin: 0 !important;
            }

            #page-action-buttons {
            height: 24px !important;
            display: flex !important;
            order: 99 !important;
            }

            #urlbar[open] #page-action-buttons,
            #urlbar[open] #tracking-protection-icon-container {
            display: none !important;
            }

            .urlbar-icon:hover:not([disabled]),
            #page-action-buttons > toolbarbutton:hover:not([disabled]),
            .searchbar-search-button:hover,
            #identity-box:hover:not(.no-hover),
            #tracking-protection-icon-container:hover #tracking-protection-icon-box {
            background-color: var(--toolbarbutton-hover-background) !important;
            }

            .urlbar-icon:hover:active:not([disabled]),
            .urlbar-icon[open],
            #page-action-buttons > toolbarbutton:hover:active:not([disabled]),
            .searchbar-search-button:hover:active,
            #identity-box:hover:active:not(.no-hover),
            #identity-box[open]:not(.no-hover),
            #tracking-protection-icon-container[open] #tracking-protection-icon-box {
            background-color: var(--toolbarbutton-active-background) !important;
            transition-duration: 0 !important;
            }

            #contextual-feature-recommendation {
            width: auto !important;
            }

            .urlbar-page-action:-moz-any(#reader-mode-button, #pageActionButton, #pocket-button-box, #pageAction-urlbar-screenshots_mozilla_org, #pageAction-urlbar-sendToDevice, #pageAction-urlbar-emailLink, #pageAction-urlbar-copyURL, #pageAction-urlbar-shareURL, #pageAction-urlbar-addSearchEngine) {
            transition: background-color 0.2s var(--ease-basic), margin 0.15s var(--ease-in), opacity 0.15s var(--ease-basic),
            visibility 0s 4s !important;
            opacity: 0 !important;
            visibility: hidden !important;
            margin-inline-start: -32px !important;
            }

            #urlbar:hover
            .urlbar-page-action:-moz-any(#reader-mode-button, #pageActionButton, #pocket-button-box, #pageAction-urlbar-screenshots_mozilla_org, #pageAction-urlbar-sendToDevice, #pageAction-urlbar-emailLink, #pageAction-urlbar-copyURL, #pageAction-urlbar-shareURL, #pageAction-urlbar-addSearchEngine),
            .urlbar-page-action:-moz-any(#reader-mode-button, #pageActionButton, #pocket-button-box, #pageAction-urlbar-screenshots_mozilla_org, #pageAction-urlbar-sendToDevice, #pageAction-urlbar-emailLink, #pageAction-urlbar-copyURL, #pageAction-urlbar-shareURL, #pageAction-urlbar-addSearchEngine):-moz-any(:hover, [open], [readeractive]),
            .urlbar-page-action:-moz-any(:hover, [open])
            ~ .urlbar-page-action:-moz-any(#reader-mode-button, #pageActionButton, #pocket-button-box, #pageAction-urlbar-screenshots_mozilla_org, #pageAction-urlbar-sendToDevice, #pageAction-urlbar-emailLink, #pageAction-urlbar-copyURL, #pageAction-urlbar-shareURL, #pageAction-urlbar-addSearchEngine),
            #tracking-protection-icon-container[open]
            ~ #page-action-buttons
            .urlbar-page-action:-moz-any(#reader-mode-button, #pageActionButton, #pocket-button-box, #pageAction-urlbar-screenshots_mozilla_org, #pageAction-urlbar-sendToDevice, #pageAction-urlbar-emailLink, #pageAction-urlbar-copyURL, #pageAction-urlbar-shareURL, #pageAction-urlbar-addSearchEngine) {
            transition: background-color 0.2s var(--ease-out), margin 0.3s var(--ease-out), opacity 0.3s var(--ease-basic) !important;
            opacity: 1 !important;
            visibility: visible !important;
            margin-inline-start: 0 !important;
            }

            .urlbar-display {
            color: inherit !important;
            margin: 0 !important;
            }

            #pocket-button-box[animate] > #pocket-animatable-box {
            margin-inline-start: 6px !important;
            }

            #star-button-animatable-box {
            display: none !important;
            }

            #userContext-icons {
            flex-direction: row !important;
            align-items: center !important;
            justify-content: center !important;
            position: relative !important;
            padding-inline: 8px !important;
            margin: 0 !important;
            color: var(--identity-tab-color) !important;
            }

            #userContext-icons:not([hidden]) {
            display: flex !important;
            }

            #userContext-icons > * {
            z-index: 1 !important;
            color: inherit !important;
            fill: currentColor !important;
            }

            #userContext-label {
            margin: 0 !important;
            }

            #userContext-label + #userContext-indicator {
            margin-inline-start: 6px !important;
            }

            #userContext-icons::before {
            content: "" !important;
            position: absolute !important;
            left: 0 !important;
            right: 0 !important;
            top: 0 !important;
            bottom: 0 !important;
            background: var(--identity-tab-color) !important;
            border-radius: 99px !important;
            opacity: 0.1 !important;
            }

            #cfr-label-container {
            background: 0 !important;
            }

            #cfr-label {
            display: none !important;
            }

            #cfr-button {
            fill: currentColor !important;
            }

            #urlbar[open] #urlbar-go-button,
            #searchbar[open] #search-go-button,
            /* < 71 */
            #urlbar[open] .urlbar-go-button,
            #searchbar[open] .search-go-button {
            height: 32px !important;
            }

            #urlbar-go-button,
            #search-go-button,
            /* < 71 */
            .urlbar-go-button,
            .search-go-button {
            list-style-image: url(go.svg) !important;
            }

            .search-go-container {
            display: flex !important;
            }

            #searchbar .textbox-input {
            padding: 0 !important;
            }

            /* lock (secure) */
            #identity-box[pageproxystate="valid"]:-moz-any(.verifiedDomain, .verifiedIdentity, .mixedActiveBlocked)
            > #identity-icon {
            list-style-image: var(--lock-icon) !important;
            }

            /* info (not secure) */
            #identity-box[pageproxystate="valid"]:-moz-any(.mixedDisplayContent, .mixedDisplayContentLoadedActiveBlocked, .unknownIdentity)
            > #identity-icon {
            list-style-image: var(--info-icon) !important;
            }

            /* warning (dangerous) */
            #identity-box[pageproxystate="valid"]:-moz-any(.notSecure, .weakCipher, .certUserOverridden, .certErrorPage, .insecureLoginForms, .mixedActiveContent)
            > #identity-icon {
            list-style-image: var(--warning-icon) !important;
            }

            #identity-box.extensionPage {
            display: none !important;
            }

            #urlbar-input,
            #searchbar-input,
            .searchbar-textbox /* < 71 */ {
            transform: translateY(var(--input-offset)) !important;
            line-height: 1.745em !important;
            margin-left: 6px !important;
            }

            .search-panel-one-offs-header.search-panel-header {
            display: none !important;
            }

            /* 1x */
            #urlbar {
            --info-icon: url(info-1x.svg);
            --lock-icon: url(connection-1x.svg);
            --warning-icon: url(connection-warning-1x.svg);
            }

            .notSecure #identity-icon {
            fill: var(--yellow) !important;
            }

            #tracking-protection-icon-box[hasException=""] #tracking-protection-icon {
            fill: var(--red) !important;
            }
            #pageActionButton {
            list-style-image: url(page-action.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            #tracking-protection-icon {
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            #identity-icon {
            margin-inline-start: 2px !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            .blocked-permission-icon.autoplay-media-icon {
            list-style-image: url(block-media.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            .blocked-permission-icon.camera-icon {
            list-style-image: url(camera-off.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }
            .blocked-permission-icon.microphone-icon {
            list-style-image: url(mic-off.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }
            .blocked-permission-icon.desktop-notification-icon {
            list-style-image: url(notification-off.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            #permissions-granted-icon {
            list-style-image: url(permissions.svg) !important;
            fill: var(--lwt-toolbarbutton-icon-fill) !important;
            }

            #urlbar,
            #searchbar {
            --input-offset: -1px;
            }

            /* 2x */
            @media (min--moz-device-pixel-ratio: 2) {
            #urlbar {
            --info-icon: url(info-2x.svg);
            --lock-icon: url(connection-2x.svg);
            --warning-icon: url(connection-warning-2x.svg);
            }

            #urlbar,
            #searchbar {
            --input-offset: -0.5px;
            }

            #identity-icon-labels {
            padding-inline-end: 0.5px !important;
            }
            }

            /*CONFIG.CSS*/

            /* order of these files is important and should not be changed */

            :root {
            --dark-0: #151d28;
            --dark-base: #192330;
            --dark-1: #233143;
            --dark-2: #2a3b51;
            --dark-3: #374e6c;
            --dark-4: #3e5879;
            --light-0: #d7dfea;
            --light-base: #afc0d5;
            --light-1: #a1b5ce;
            --light-2: #94abc7;
            --light-3: #87a0c0;
            --light-4: #7996b9;
            --accent: #63cdcf;
            --yellow: #dbc074;
            --green: #5cb8a7;
            --red: #c94f6d;
            --extension-icon-mask: grayscale(85%) invert(75%) sepia(8%) saturate(862%) hue-rotate(173deg) brightness(88%);

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
            --wc-vertical-shift: 18px;
            /* larger value moves window controls down,*/
            /* can be negative(moves controls up) */
            /* Experiemntal: 55px if tabline visible, -25px if tabline hidden */
            --wc-left-space: 15px; /* add space to the left of window controls*/
            --wc-right-space: 18px; /* add space to the right of window controls*/
            /* left-space shifts window-controls */
            /* if you want to shift window controls to the left: positive value */
            /* if you want to shift them to the right: smaller or negative value */
            /* right-space shifts rest of the navbar (forward,backward,urlbar,etc.) to the right */
            /* if you want to increase/decrease space between window-controls and navbars: */
            /* set positive/smaller or negative value for right-space*/
            }

            :root[privatebrowsingmode="temporary"] {
            --dark-0: #1c0e34;
            --dark-base: #20103c;
            --dark-1: #2f1d4e;
            --dark-2: #38225d;
            --dark-3: #4a2d7b;
            --dark-4: #53338a;
            --light-0: #cc6b9c;
            --light-base: #b9407c;
            --light-1: #ab3b73;
            --light-2: #9c3569;
            --light-3: #8d305e;
            --light-4: #7d2b54;
            --accent: #e9207e;
            --yellow: #c9b336;
            --green: #36c987;
            --red: #c9365d;
            --extension-icon-mask: grayscale(85%) invert(13%) sepia(80%) saturate(3107%) hue-rotate(256deg) brightness(84%)
            contrast(93%);
            }
            .tabbrowser-tab{
            display: none;
            }
            #tabs-newtab-button{
            display: none;
            }

            /*USER CHROME HOVER*/

            #sidebar-box {
            z-index: 1000 !important;
            position: relative !important;
            min-width: var(--sidebar-collapsed-width) !important;
            max-width: var(--sidebar-collapsed-width) !important;
            }

            #sidebar-header,
            #sidebar-splitter {
            display: none !important;
            }

            /* inner width = expanded width & move inner to only show initial-width long section */
            #sidebar-box #sidebar {
            position: absolute !important;
            min-width: var(--sidebar-width) !important;
            max-width: var(--sidebar-width) !important;
            width: var(--sidebar-width) !important;
            transform: translateX(calc(var(--sidebar-collapsed-width) - var(--sidebar-width)));
            transition: all var(--transition-time) var(--ease-out);
            }

            /* move inner to show entire sidebar */
            #sidebar-box #sidebar:hover {
            transform: translateX(0) !important;
            box-shadow: 2px 0 33px -3px var(--sidebar-shadow-color);
            }

            #sidebar-box[sidebarcommand="viewBookmarksSidebar"] #sidebar {
            transform: translateX(0) !important;
            box-shadow: 2px 0 33px -3px var(--sidebar-shadow-color);
            }
            /* hide sidebar header for tree style tabs sidebar */

            #sidebar {
            border-right: solid var(--dividers) var(--sidebar-shadow-color) !important;
            }

            toolbar {
            border: none !important;
            }

            /* hide tabs */
            .tabbrowser-tab {
            display: none;
            }

            #tabs-newtab-button {
            display: none;
            }

            .titlebar-spacer {
            display: none !important;
            }
          '';
          userContent = ''
            *{scrollbar-width:none !important}
          '';
        };
    };
}
