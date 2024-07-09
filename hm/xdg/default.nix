{ config, pkgs, ... }:
{
  xdg.mime.enable = true;
  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = { 
    "application/pdf" = "org.zathura.desktop"; 
    "application/epub+zip" = "calibre-ebook-viewer.desktop";
    "application/x-mobipocket-ebook" = "calibre-ebook-viewer.desktop";

    "audio/mpeg" = "mpv.desktop";
    "audio/mp4" = "mpv.desktop";
    "audio/webm" = "mpv.desktop";
    "audio/x-flac" = "mpv.desktop";

    "text/html" = "librewolf.desktop";
  };
}
