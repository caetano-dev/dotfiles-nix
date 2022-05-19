{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;

    userSettings = {

      # lines
      "editor.lineNumbers" = "relative";

      # minimap
      "editor.minimap.enabled" = false;

      # auto update tags when edited
      "editor.linkedEditing" = true;
      "editor.rulers" = [ 80 120 ];
      "editor.formatOnSave" = true;

      # font
      "editor.fontSize" = 14;
      "editor.fontLigatures" = true;
      "editor.fontFamily" = "Hasklug Nerd Font";

      # smooth
      "editor.cursorBlinking" = "phase";
      "editor.cursorSmoothCaretAnimation" = true;
      "editor.smoothScrolling" = true;

      # bracket
      "editor.bracketPairColorization.enabled" = true;
      "editor.guides.bracketPairs" = "active";

      # terminal font
      "terminal.integrated.fontFamily" = "hasklig";

      # tree indent
      "workbench.tree.indent" = 15;

      "window.menuBarVisibility" = "toggle";
      "window.titleBarStyle" = "custom";

      "workbench.colorTheme" = "Gruvbox Dark Medium";

      "workbench.iconTheme" = "file-icons";

      # fuck telemetry
      "telemetry.telemetryLevel" = "off";
      # except for github copilot ❤️
      "editor.inlineSuggest.enabled" = true;

      # tabnine
      "tabnine.experimentalAutoImports" = true;

      # disable welcome
      "workbench.startupEditor" = "newUntitledFile";

      # Nix
      "nix.enableLanguageServer" = true;
      "[nix]" = {
        "editor.tabSize" = 2;
        "editor.insertSpaces" = true;
      };
    };

    extensions = with pkgs.vscode-extensions; [

      ## Icons
      file-icons.file-icons

      ## Git
      eamodio.gitlens

      ## Nix
      jnoortheen.nix-ide

      ## Go
      golang.go

      ## Rust
      matklad.rust-analyzer
      vadimcn.vscode-lldb # debug
      serayuzgur.crates

      ## Markdown
      yzhang.markdown-all-in-one

      #github.copilot
      github.copilot

      #vim
      vscodevim.vim

      #c/c++
      ms-vscode.cpptools

      #python
      ms-python.python

      #path-intellisense
      christian-kohler.path-intellisense

      ## rescript
      chenglou92.rescript-vscode

      ## tabnine
      tabnine.tabnine-vscode

      ## auto rename tag
      formulahendry.auto-rename-tag

      ## colorize
      kamikillerto.vscode-colorize

      ## Misc
      eamodio.gitlens
      editorconfig.editorconfig
      esbenp.prettier-vscode
      usernamehw.errorlens
    ];
  };
}
