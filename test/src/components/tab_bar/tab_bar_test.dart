import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

/// A [TabController] that tracks its listeners.
class _TrackingTabController extends TabController {
  _TrackingTabController() : super(length: 2, vsync: const TestVSync());

  var listeners = 0;

  @override
  void addListener(VoidCallback listener) {
    listeners++;
    super.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    listeners--;
    super.removeListener(listener);
  }
}

void main() {
  testWidgets('moves its listener to a new controller', (tester) async {
    final controllerA = _TrackingTabController();
    final controllerB = _TrackingTabController();
    addTearDown(controllerA.dispose);
    addTearDown(controllerB.dispose);
    var controller = controllerA;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(builder: (context, setter) {
        setState = setter;
        return ImpaktfullUiTabBar(
          controller: controller,
          items: const [Text('a'), Text('b')],
        );
      }),
    );
    expect(controllerA.listeners, 1);
    expect(controllerB.listeners, 0);

    setState(() => controller = controllerB);
    await tester.pumpAndSettle();
    expect(controllerA.listeners, 0);
    expect(controllerB.listeners, 1);

    await tester.pumpWidget(const SizedBox());
    expect(controllerA.listeners, 0);
    expect(controllerB.listeners, 0);
  });
}
