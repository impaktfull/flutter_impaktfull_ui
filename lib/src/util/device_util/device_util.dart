import 'device_util.dart'
    if (dart.library.html) 'device_util_web.dart'
    if (dart.library.io) 'device_util_io.dart' as platform;

class DeviceUtil {
  // Web
  static bool isWeb() => platform.DeviceUtil.isWeb();

  static bool isMobileWeb() => platform.DeviceUtil.isMobileWeb();

  // Mobile
  static bool isMobile() => platform.DeviceUtil.isMobile();

  static bool isAndroid() => platform.DeviceUtil.isAndroid();

  static bool isIos() => platform.DeviceUtil.isIos();

  // Desktop
  static bool isDesktop() => platform.DeviceUtil.isDesktop();

  static bool isMacOs() => platform.DeviceUtil.isMacOs();

  static bool isWindows() => platform.DeviceUtil.isWindows();

  static bool isLinux() => platform.DeviceUtil.isLinux();

  // General
  static bool isApple() => platform.DeviceUtil.isApple();
}
