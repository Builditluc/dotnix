{ config, pkgs, ... }:
{
  imports = [ 
    ./gh.nix 
    ./delta.nix
  ];

  programs.git = {
    enable = true;
    
    userName = "Builditluc";
    userEmail = "git@builditluc.eu";

    signing.key = "62F515FE2B41AE9ED18792A86139D472C7AE6CB0";
    signing.signByDefault = true;

    extraConfig = {
      core.editor = "nvim";
    };
  };
}
