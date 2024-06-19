{ config, pkgs, ... }:

{
  services.thermald.enable = true;

  services.tlp.enable = true;
  services.tlp.settings = {
    TLP_DEFAULT_MODE = "BAT";

    SOUND_POWER_SAVE_ON_AC = 0;
    SOUND_POWER_SAVE_ON_BAT = 1;
    SOUND_POWER_SAVE_CONTROLLER = true;

    CPU_SCALING_GOVERNOR_ON_AC = "performance";
    CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

    CPU_MIN_PERF_ON_AC = 0;
    CPU_MAX_PERF_ON_AC = 100;
    CPU_MIN_PERF_ON_BAT = 0;
    CPU_MAX_PERF_ON_BAT = 30;

    CPU_BOOST_ON_AC = true;
    CPU_BOOST_ON_BAT = false;

    CPU_HWP_DYN_BOOST_ON_AC = true;
    CPU_HWP_DYN_BOOST_ON_BAT = false;

    PLATFORM_PROFILE_ON_AC = "performance";
    PLATFORM_PROFILE_ON_BAT = "low-power";

    INTEL_GPU_MIN_FREQ_ON_AC = 300;
    INTEL_GPU_MAX_FREQ_ON_AC = 1500;
    INTEL_GPU_BOOST_FREQ_ON_AC = 1500;

    INTEL_GPU_MIN_FREQ_ON_BAT = 100;
    INTEL_GPU_MAX_FREQ_ON_BAT = 800;
    INTEL_GPU_BOOST_FREQ_ON_BAT= 1000;

    #PCIE_ASPM_ON_AC = "default";
    #PCIE_ASPM_ON_BAT = "powersupersave";
    #PCIE_PM_ON_AC = false;
    #PCIE_PM_ON_BAT = true;

    #WIFI_PWR_ON_AC = false;
    #WIFI_PWR_ON_BAT = false; # due to WiFi drop outs
    #WOL_DISABLE = true;

    DEVICES_TO_DISABLE_ON_STARTUP = "bluetooth wifi wwan";
    DEVICES_TO_DISABLE_ON_LAN_CONNECT = "wifi wwan";
    DEVICES_TO_DISABLE_ON_WIFI_CONNECT = "wwan";
    DEVICES_TO_DISABLE_ON_WWAN_CONNECT = "wifi";

    #USB_AUTOSUSPEND = true;
    #USB_EXCLUDE_AUDIO = true;
    #USB_EXCLUDE_BTUSB = false;
    #USB_EXCLUDE_PHONE = false;
    #USB_EXCLUDE_PRINTER = true;
    #USB_EXCLUDE_WWAN = false;
  };
}
