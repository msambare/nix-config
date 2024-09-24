{ pkgs, ... }: {

  imports = [
    ../../modules/browser
    ../../modules/terminal
    ../../modules/keyring
    ../../modules/window_manager
  ];

}
