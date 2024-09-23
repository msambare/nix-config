{ pkgs, lib, config, username, ... }: {

    options = {
        gnome-keyring.enable = lib.mkEnableOption "enables gnome-keyring";
    };

    config = lib.mkIf config.gnome-keyring.enable {
        home-manager.users.${username} = {
            services.gnome-keyring.enable = true;
        };
    };
}