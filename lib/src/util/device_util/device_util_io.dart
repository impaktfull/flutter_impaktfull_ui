import 'dart:io';

class DeviceUtil {
  // Web
  static bool isWeb() => false;

  static bool isMobileWeb() => false;

  // Mobile
  static bool isMobile() => Platform.isAndroid || Platform.isIOS;

  static bool isAndroid() => Platform.isAndroid;

  static bool isIos() => Platform.isIOS;

  // Desktop
  static bool isDesktop() => Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  static bool isMacOs() => Platform.isMacOS;

  static bool isWindows() => Platform.isWindows;

  static bool isLinux() => Platform.isLinux;

  // General
  static bool isApple() => Platform.isIOS || Platform.isMacOS;
}
