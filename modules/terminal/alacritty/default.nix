{ pkgs, lib, config, username, ... }: {

  options = {
    # Option to enable/disable Alacritty installation
    alacritty.enable = lib.mkEnableOption "Enables the installation of Alacritty for the user.";
  };

  config = lib.mkIf config.alacritty.enable {
    home-manager.users.${username} = {
      # Install alacritty terminal emulator via home.packages
      home.packages = [ pkgs.alacritty ];
    };
  };
}
