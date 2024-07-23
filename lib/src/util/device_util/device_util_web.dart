import 'package:flutter/foundation.dart' show kIsWeb;
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

bool isMobileWeb() {
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
