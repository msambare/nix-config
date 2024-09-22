{ pkgs, lib, config, ... }: {

    options = {
        alacritty.enable = lib.mkEnableOption "enables alacritty";
    };

    config = {
        programs.alacritty.enable = true;
    };
}
