{ pkgs, lib, config, ... }: {

    options = {
        gnome-keyring.enable = lib.mkEnableOption "enables gnome-keyring";
    };

    config = {
        services.gnome.gnome-keyring.enable = true;
    };
}