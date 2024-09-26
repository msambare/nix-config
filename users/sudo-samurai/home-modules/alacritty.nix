{ lib, config, username, ... }: {

  options = {
    # Option to enable/disable Alacritty configuration
    alacrittyConfig.enable = lib.mkEnableOption "Enables custom configuration of Alacritty for the user.";
  };

  config = lib.mkIf config.alacrittyConfig.enable {
    home-manager.users.${username}.programs.alacritty = {
      enable = true;
      settings = {
        font = {
          size = 12;
          family = "FiraCode";
        };
        colors = {
          primary = {
            background = "#1e1e1e";
            foreground = "#c5c8c6";
          };
        };
      };
    };
  };
}
