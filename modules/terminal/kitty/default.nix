{ pkgs, lib, config, ... }: {

    options = {
        kitty.enable = lib.mkEnableOption "enables kitty";
    };

    config = {
        programs.kitty.enable = true;
    };
}
