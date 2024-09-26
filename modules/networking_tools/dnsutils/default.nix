{ pkgs, lib, config, username, ... }: {

  options = {
    # Define an option to enable/disable dnsutils for a user
    dnsutils.enable = lib.mkEnableOption "Enables the installation of dnsutils for the user.";
  };

  config = lib.mkIf config.dnsutils.enable {
    # Define the home manager user configuration
    home-manager.users.${username} = {
      # Add dnsutils to the user's installed packages
      home.packages = [ pkgs.dnsutils ];
    };
  };
}
