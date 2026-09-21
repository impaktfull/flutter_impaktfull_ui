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
        return ImpaktfullUiTabBarItem(
          label: 'b',
          index: 1,
          controller: controller,
        );
      }),
    );
    expect(controllerA.listeners, 1);
    expect(controllerB.listeners, 0);

    setState(() => controller = controllerB);
    await tester.pumpAndSettle();
    expect(controllerA.listeners, 0);
    expect(controllerB.listeners, 1);

    // The item follows the new controller.
    AnimatedOpacity marker() => tester.widget<AnimatedOpacity>(find.descendant(
          of: find.byType(ImpaktfullUiTabBarItem),
          matching: find.byType(AnimatedOpacity),
        ));
    expect(marker().opacity, 0);
    controllerB.index = 1;
    await tester.pumpAndSettle();
    expect(marker().opacity, 1);

    await tester.pumpWidget(const SizedBox());
    expect(controllerA.listeners, 0);
    expect(controllerB.listeners, 0);
  });
}
