{ pkgs, lib, config, username, ... }: {

    options = {
        kitty.enable = lib.mkEnableOption "enables kitty";
    };

    config = {
        home-manager.users.${username} = {
            programs.kitty.enable = true;
        };
    };
}
