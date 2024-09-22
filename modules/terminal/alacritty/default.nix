{ pkgs, lib, config, username, ... }: {

    options = {
        alacritty.enable = lib.mkEnableOption "enables alacritty";
    };

    config = {
        home-manager.users.${username} = {
            programs.alacritty.enable = true;
        };
    };
}
