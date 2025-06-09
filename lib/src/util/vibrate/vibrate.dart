import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

class Vibrate {
  static void vibrate() {
    if (DeviceUtil.isMobile()) {
      HapticFeedback.lightImpact();
    }
  }

  static void vibrateHeavy() {
    if (DeviceUtil.isMobile()) {
      HapticFeedback.heavyImpact();
    }
  }

  static void vibrateMedium() {
    if (DeviceUtil.isMobile()) {
      HapticFeedback.mediumImpact();
    }
  }

  static void vibrateSelection() {
    if (DeviceUtil.isMobile()) {
      HapticFeedback.selectionClick();
    }
  }
}
