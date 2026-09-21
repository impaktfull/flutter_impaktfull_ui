import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('maybeOf returns null outside an ImpaktfullUiScreen',
      (tester) async {
    ImpaktfullUiScreenState? state;
    var called = false;
    await pumpAndSettleComponent(
      tester,
      Builder(builder: (context) {
        state = ImpaktfullUiScreen.maybeOf(context);
        called = true;
        return const SizedBox();
      }),
    );
    expect(called, isTrue);
    expect(state, isNull);
  });

  testWidgets('maybeOf and of return the state inside an ImpaktfullUiScreen',
      (tester) async {
    ImpaktfullUiScreenState? maybeState;
    ImpaktfullUiScreenState? state;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiScreen(
        child: Builder(builder: (context) {
          maybeState = ImpaktfullUiScreen.maybeOf(context);
          state = ImpaktfullUiScreen.of(context);
          return const SizedBox();
        }),
      ),
    );
    final expected = tester.state<ImpaktfullUiScreenState>(
      find.byType(ImpaktfullUiScreen),
    );
    expect(maybeState, same(expected));
    expect(state, same(expected));
  });

  testWidgets('of asserts with a readable message', (tester) async {
    Object? error;
    await pumpAndSettleComponent(
      tester,
      Builder(builder: (context) {
        try {
          ImpaktfullUiScreen.of(context);
        } catch (e) {
          error = e;
        }
        return const SizedBox();
      }),
    );
    expect(error, isA<AssertionError>());
    expect(
      (error! as AssertionError).message,
      'No ImpaktfullUiScreen found in context',
    );
  });
}
