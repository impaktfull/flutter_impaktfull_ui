import 'dart:io';

class DeviceUtil {
  // Web
  bool isWeb() => false;

  bool isMobileWeb() => false;

  // Mobile
  bool isMobile() => Platform.isAndroid || Platform.isIOS;

  bool isAndroid() => Platform.isAndroid;

  bool isIos() => Platform.isIOS;

  // Desktop
  bool isDesktop() =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;

  bool isMacOs() => Platform.isMacOS;

  bool isWindows() => Platform.isWindows;

  bool isLinux() => Platform.isLinux;

  // General
  bool isApple() => Platform.isIOS || Platform.isMacOS;
}
