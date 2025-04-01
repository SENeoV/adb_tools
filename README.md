# ADB Tools Toolkit

A collection of Windows batch scripts to simplify common ADB (Android Debug Bridge) operations for Android device management.

## Features

- List installed apps (user/system/all)
- Locate app APK paths
- Manage system apps (disable, restore, remove from user)
- Pre-bundled ADB/Fastboot binaries
- Simple batch interface

## Prerequisites

1. Enabled USB Debugging on Android device
2. USB drivers installed for your device
3. Trust computer when prompted on device

## Usage

1. Clone/download repository
2. Connect Android device via USB
3. Run desired batch file

## Batch Files Overview
| File | Description | Usage Example |
|------|-------------|---------------|
| `all_apps.bat` | List all packages | `all_apps.bat` |
| `user_apps.bat` | List user-installed apps | `user_apps.bat` |
| `system_apps.bat` | List system apps | `system_apps.bat` |
| `app_locate.bat` | Show APK path | `app_locate.bat com.example.app` |
| `system_app_disable.bat` | Disable system app | `system_app_disable.bat com.bloatware.app` |
| `system_app_restore.bat` | Restore system app | `system_app_restore.bat com.bloatware.app` |
| `system_app_delete_from_user.bat` | Remove app for current user | `system_app_delete_from_user.bat com.bloatware.app` |
| `screenshot.bat` | Take a screenshot from the device | `screenshot.bat` |
| `device_info.bat` | Get device info | `device_info.bat` |
| `adb_clean.bat` | Restart adb daemon | `adb_clean.bat` |
| `adb_reboot.bat` | Normal device reboot | `adb_reboot.bat` |
| `adb_reboot_recovery.bat` | Reboot to recovery mode | `adb_reboot_recovery.bat` |
| `adb_reboot_bootloader.bat` | Reboot to fastboot mode | `adb_reboot_bootloader.bat` |
| `adb_sideload.bat` | Apply OTA updates | `adb_sideload.bat update.zip` |
| `adb_push.bat` | Transfer files to device | `adb_push.bat local.txt /sdcard/` |
| `adb_pull.bat` | Retrieve files from device | `adb_pull.bat /sdcard/file.txt backups/` |

⚠️ Use with caution! Modifying system apps can cause device instability. Always verify package names before executing commands.

## Contributing

Contributions welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

Batch scripts are MIT licensed. ADB/Fastboot binaries are part of [Android SDK](https://developer.android.com/studio/releases/platform-tools) (Apache License 2.0).