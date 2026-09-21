import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

void main() {
  testWidgets('shows the texts without actions', (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      const ImpaktfullUiScreen(child: ImpaktfullUiBBNotFound()),
    );
    expect(find.text('Page not found'), findsOneWidget);
    expect(find.text('We were not able to find this page'), findsOneWidget);
    expect(find.byType(ImpaktfullUiButton), findsNothing);
  });

  testWidgets('the actions are shown and can be tapped', (tester) async {
    final taps = <String>[];
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBNotFound(
          actions: [
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.secondary,
              title: 'Go back',
              onTap: () => taps.add('back'),
            ),
            ImpaktfullUiButton(
              type: ImpaktfullUiButtonType.primary,
              title: 'Home',
              onTap: () => taps.add('home'),
            ),
          ],
        ),
      ),
    );
    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Go back'));
    await tester.pumpAndSettle();
    expect(taps, ['home', 'back']);
  });

  testWidgets('the builders and alignment are passed to the layout',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiScreen(
        child: ImpaktfullUiBBNotFound(
          alignment: Alignment.bottomCenter,
          topBuilder: (context) => const Text('top'),
          bottomBuilder: (context) => const Text('bottom'),
        ),
      ),
    );
    final layout = tester.widget<ImpaktfullUiUnifiedScreenLayout>(
        find.byType(ImpaktfullUiUnifiedScreenLayout));
    expect(layout.alignment, Alignment.bottomCenter);
    expect(find.text('top'), findsOneWidget);
    expect(find.text('bottom'), findsOneWidget);
  });
}
