{ pkgs, lib, config, username, ... }: {

    options = {
        vivaldi.enable = lib.mkEnableOption "enables vivaldi";
    };

    config = lib.mkIf config.vivaldi.enable {
        home-manager.users.${username} = {
            programs.chromium = {
                enable = true;
                package = pkgs.vivaldi;
            };
        };
    };
}