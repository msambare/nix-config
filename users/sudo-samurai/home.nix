{ pkgs, ... }: {

  imports = [

    ../base_user.nix

  ];

  programs.git = {
    userName = "msambare";
    userEmail = "mangesh@sambare.in";
  };

}
