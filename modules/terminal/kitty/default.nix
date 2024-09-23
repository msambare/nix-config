{ pkgs, lib, config, username, ... }: {

    options = {
        kitty.enable = lib.mkEnableOption "enables kitty";
    };

    config = lib.mkIf config.kitty.enable  {
        home-manager.users.${username} = {
            programs.kitty.enable = true;
        };
    };
}
