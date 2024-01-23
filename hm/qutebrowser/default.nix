{ config, pkgs, ... }:
{
  programs.qutebrowser.enable = true;
  programs.qutebrowser.package = pkgs.qutebrowser.override { enableWideVine = true; };
  programs.qutebrowser.quickmarks = {
    fortbildung-informatik =
      "https://lehrerfortbildung-bw.de/u_matnatech/informatik/gym/bp2016/fb2/";
  };
  programs.qutebrowser.searchEngines = {
    ddg = "https://duckduckgo.com/?q={}";
    ns = "https://search.nixos.org/packages?query={}";
  };
}
