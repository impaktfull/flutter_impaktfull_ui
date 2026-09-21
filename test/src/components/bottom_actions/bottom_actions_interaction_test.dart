import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_layout_test_helpers.dart';

void main() {
  const safeArea = EdgeInsets.only(bottom: 34);

  /// Pumps [child] at the bottom of a column, like the bottomChild of an
  /// [ImpaktfullUiScreen].
  Future<void> pump(WidgetTester tester, Widget child) => pumpLayoutApp(
        tester,
        Builder(
          builder: (context) => MediaQuery(
            data: MediaQuery.of(context).copyWith(padding: safeArea),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                child,
              ],
            ),
          ),
        ),
      );

  ImpaktfullUiBottomActionsTheme actionsTheme(WidgetTester tester) =>
      ImpaktfullUiBottomActionsTheme.of(
          tester.element(find.byType(ImpaktfullUiBottomActions)));

  testWidgets('stacks the children with the theme spacing and padding',
      (tester) async {
    await pump(
      tester,
      const ImpaktfullUiBottomActions(
        children: [
          SizedBox(height: 40, key: Key('a')),
          SizedBox(height: 40, key: Key('b')),
        ],
      ),
    );
    final dimens = actionsTheme(tester).dimens;
    final a = tester.getRect(find.byKey(const Key('a')));
    final b = tester.getRect(find.byKey(const Key('b')));
    expect(b.top - a.bottom, dimens.spacing);
    final actions = tester.getRect(find.byType(ImpaktfullUiBottomActions));
    expect(actions.width, smallScreenSize.width);
    expect(actions.bottom, smallScreenSize.height);
    expect(a.top - actions.top, dimens.padding.top);
    // The bottom safe area is added to the padding.
    expect(actions.bottom - b.bottom, dimens.padding.bottom + safeArea.bottom);
  });

  testWidgets('removeBottomSafeArea ignores the bottom safe area',
      (tester) async {
    await pump(
      tester,
      const ImpaktfullUiBottomActions(
        removeBottomSafeArea: true,
        children: [SizedBox(height: 40, key: Key('a'))],
      ),
    );
    final dimens = actionsTheme(tester).dimens;
    final a = tester.getRect(find.byKey(const Key('a')));
    final actions = tester.getRect(find.byType(ImpaktfullUiBottomActions));
    expect(actions.bottom - a.bottom, dimens.padding.bottom);
  });

  testWidgets('the actions can be tapped', (tester) async {
    var taps = 0;
    await pump(
      tester,
      ImpaktfullUiBottomActions(
        children: [
          ImpaktfullUiButton(
            type: ImpaktfullUiButtonType.primary,
            title: 'Continue',
            onTap: () => taps++,
          ),
        ],
      ),
    );
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();
    expect(taps, 1);
  });

  testWidgets('wraps its content in a loosely constrained parent',
      (tester) async {
    await pumpLayoutApp(
      tester,
      const Align(
        alignment: Alignment.bottomCenter,
        child: ImpaktfullUiBottomActions(
          removeBottomSafeArea: true,
          children: [SizedBox(height: 40)],
        ),
      ),
    );
    final dimens = actionsTheme(tester).dimens;
    expect(
      tester.getSize(find.byType(ImpaktfullUiBottomActions)).height,
      40 + dimens.padding.vertical,
    );
  });
}
