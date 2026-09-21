import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

void main() {
  test('DeviceUtil uses the io implementation on the Dart VM', () {
    expect(DeviceUtil.isWeb(), isFalse);
    expect(DeviceUtil.isMobileWeb(), isFalse);
    expect(DeviceUtil.isMacOs(), Platform.isMacOS);
    expect(DeviceUtil.isLinux(), Platform.isLinux);
    expect(DeviceUtil.isWindows(), Platform.isWindows);
  });

  test('conditional import has a platform implementation for every target', () {
    // dart.library.html is not available when compiling to Wasm. The old
    // import fell back to device_util.dart itself there, so every DeviceUtil
    // method called itself until the stack overflowed.
    final source =
        File('lib/src/util/device_util/device_util.dart').readAsStringSync();
    expect(source, isNot(contains("import 'device_util.dart'")));
    expect(source, isNot(contains('if (dart.library.html)')));
    expect(source,
        contains("if (dart.library.js_interop) 'device_util_web.dart'"));
  });
}
