{ pkgs, lib, config, username, ... }: {

  options = {
    # Option to enable/disable kitty terminal emulator
    kitty.enable = lib.mkEnableOption "Enables the installation of Kitty terminal for the user.";
  };

  config = lib.mkIf config.kitty.enable {
    home-manager.users.${username} = {
      # Install kitty terminal emulator via home.packages
      home.packages = [ pkgs.kitty ];
    };
  };
}
