{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerdfonts
    powerline
    material-design-icons
  ];

}