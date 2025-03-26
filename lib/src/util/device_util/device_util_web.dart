import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:web/web.dart' as html;

class DeviceUtil {
  // Web
  static bool isWeb() => kIsWeb;

  static bool isMobileWeb() {
    if (kIsWeb) {
      final userAgent = html.window.navigator.userAgent.toLowerCase();
      final isMobile = userAgent.contains('iphone') ||
          userAgent.contains('ipad') ||
          userAgent.contains('android') ||
          userAgent.contains('mobile');
      return isMobile;
    }
    return false;
  }

  // Mobile
  static bool isMobile() => false;

  static bool isAndroid() => false;

  static bool isIos() => false;

  // Desktop
  static bool isDesktop() => false;

  static bool isMacOs() => false;

  static bool isWindows() => false;

  static bool isLinux() => false;

  // General
  static bool isApple() => false;
}
