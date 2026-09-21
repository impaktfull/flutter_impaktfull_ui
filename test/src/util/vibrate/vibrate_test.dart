import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/src/util/device_util/device_util.dart';
import 'package:impaktfull_ui/src/util/vibrate/vibrate.dart';

void main() {
  // Vibrate only calls the platform on a mobile device, which is decided by
  // `dart:io` Platform and can not be mocked. On the test host (macOS, Linux
  // or Windows) no haptic feedback may be sent.
  testWidgets('does not send haptic feedback on a desktop host',
      (tester) async {
    expect(DeviceUtil.isMobile(), isFalse);
    final calls = <MethodCall>[];
    tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
      SystemChannels.platform,
      (call) async {
        calls.add(call);
        return null;
      },
    );
    addTearDown(() => tester.binding.defaultBinaryMessenger
        .setMockMethodCallHandler(SystemChannels.platform, null));

    Vibrate.vibrate();
    Vibrate.vibrateMedium();
    Vibrate.vibrateHeavy();
    Vibrate.vibrateSelection();
    await tester.pump();

    expect(
      calls.where((e) => e.method.startsWith('HapticFeedback')),
      isEmpty,
    );
  });
}
