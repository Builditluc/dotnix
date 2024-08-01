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

    aliases.lg = "lg1";
    aliases.lg1 = "lg1-specific --all";
    aliases.lg2 = "lg2-specific --all";
    aliases.lg3 = "lg3-specific --all";

    aliases.lg1-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold
    blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)-
    %an%C(reset)%C(auto)%d%C(reset)'";
    aliases.lg2-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold
    blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset)%C(auto)%d%C(reset)%n''
    %C(white)%s%C(reset) %C(dim white)- %an%C(reset)'";
    aliases.lg3-specific = "log --graph --abbrev-commit --decorate --format=format:'%C(bold
    blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold
    cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''
    %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'";

    extraConfig = {
      core.editor = "nvim";
    };
  };
}
