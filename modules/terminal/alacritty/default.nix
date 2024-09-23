{ pkgs, lib, config, username, ... }: {

    options = {
        alacritty.enable = lib.mkEnableOption "enables alacritty";
    };

    config = lib.mkIf config.alacritty.enable {
        home-manager.users.${username} = {
            programs.alacritty.enable = true;
        };
    };
}
