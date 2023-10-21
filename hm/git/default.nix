{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    
    userName = "Builditluc";
    userEmail = "37375448+Builditluc@users.noreply.github.com";

    signing.key = "62F515FE2B41AE9ED18792A86139D472C7AE6CB0";
    signing.signByDefault = true;
  };
}
