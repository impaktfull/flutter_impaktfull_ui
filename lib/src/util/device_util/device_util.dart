// dart.library.js_interop is available on every web target (JS and Wasm),
// dart.library.html is not available when compiling to Wasm.
import 'device_util_io.dart' if (dart.library.js_interop) 'device_util_web.dart'
    as platform;

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
