// Runs on the Dart VM and in Chrome, with JS and Wasm (tool/test_web.sh):
// DeviceUtil picks its implementation with a conditional import, so every
// platform must get a working one.

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

void main() {
  test('isWeb is only true on the web', () {
    expect(DeviceUtil.isWeb(), kIsWeb);
  });

  test('exactly one platform family matches', () {
    final families = [
      DeviceUtil.isWeb(),
      DeviceUtil.isMobile(),
      DeviceUtil.isDesktop(),
    ];
    expect(families.where((matches) => matches), hasLength(1));
  });

  test('mobile, desktop and apple agree with the platform', () {
    expect(
      DeviceUtil.isMobile(),
      DeviceUtil.isAndroid() || DeviceUtil.isIos(),
    );
    expect(
      DeviceUtil.isDesktop(),
      DeviceUtil.isMacOs() || DeviceUtil.isWindows() || DeviceUtil.isLinux(),
    );
    expect(DeviceUtil.isApple(), DeviceUtil.isIos() || DeviceUtil.isMacOs());
    if (!kIsWeb) expect(DeviceUtil.isMobileWeb(), isFalse);
  });

  test('does not recurse on the web', () {
    // Every method called itself when compiled to Wasm, until the stack
    // overflowed
    expect(DeviceUtil.isMobileWeb, returnsNormally);
    expect(DeviceUtil.isDesktop, returnsNormally);
  });
}
