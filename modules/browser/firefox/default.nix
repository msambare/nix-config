{ pkgs, lib, config, username, ... }: {

    options = {
        firefox.enable = lib.mkEnableOption "enables firefox";
    };

    config = lib.mkIf config.firefox.enable {
        home-manager.users.${username} = {
            programs.firefox.enable = true;
        };
    };
}