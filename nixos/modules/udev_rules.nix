{ pkgs-unstable, ... }:
{
  services.udev.extraRules =
   '' SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", MODE="0660", GROUP="adbusers", TAG+="uaccess", '' +
   '' SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e26", SYMLINK+="android_adb", '' +
   '' SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4e26", SYMLINK+="android_fastboot" '';
}
