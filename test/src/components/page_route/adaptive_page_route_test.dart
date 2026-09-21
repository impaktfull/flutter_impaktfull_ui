import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';

void main() {
  test('uses the desktop route on desktop and a material route elsewhere', () {
    final route = ImpaktfullUiAdaptivePageRoute.create<void>(
      builder: (context) => const SizedBox(),
    );
    if (DeviceUtil.isDesktop()) {
      expect(route, isA<ImpaktfullUiDesktopPageRoute<void>>());
    } else {
      expect(route, isA<MaterialPageRoute<void>>());
    }
  });
}
