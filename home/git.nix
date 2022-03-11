{
  programs.git = {
    enable = true;

    userName = "drull1000";
    userEmail = "pcaetanop@protonmail.com";

    delta = {
      enable = true;
      options = {
        features = "side-by-side line-numbers decorations";
        delta = {
          navigate = true;
        };
        line-numbers = {
          line-numbers-minus-style = 124;
          line-numbers-plus-style = 28;
        };
      };
    };
  };
}
