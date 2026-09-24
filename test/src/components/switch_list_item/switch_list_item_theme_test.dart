import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// The switch of a list item is built without a `theme`, so it follows the
/// `ImpaktfullUiSwitchTheme` of the app: a theme that resizes the switch
/// resizes the one in the list item too.

ImpaktfullUiTheme _themeWithThumbSize(double thumbSize) {
  final theme = ImpaktfullUiTheme.getDefault();
  final switchTheme = theme.components.switchTheme;
  return theme.copyWith(
    components: theme.components.copyWith(
      switchTheme: switchTheme.copyWith(
        dimens: switchTheme.dimens.copyWith(
          thumbSize: thumbSize,
          verticalPadding: 2,
          horizontalPadding: 24,
        ),
      ),
    ),
  );
}

Size _thumbSize(WidgetTester tester) => tester.getSize(
      find
          .descendant(
            of: find.byType(ImpaktfullUiSwitch),
            matching: find.byType(AnimatedContainer),
          )
          .last,
    );

Size _trackSize(WidgetTester tester) => tester.getSize(
      find.descendant(
        of: find.byType(ImpaktfullUiSwitch),
        matching: find.byType(ImpaktfullUiTouchFeedback),
      ),
    );

void main() {
  testWidgets('the switch of a list item follows the switch theme',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Notifications',
        value: true,
        onChanged: (_) {},
      ),
      theme: _themeWithThumbSize(18),
    );
    expect(_thumbSize(tester), const Size.square(18));
    expect(_trackSize(tester), const Size(44, 22));
  });

  testWidgets('the switch of a list item keeps its own size by default',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiSwitchListItem(
        title: 'Notifications',
        value: true,
        onChanged: (_) {},
      ),
    );
    expect(_thumbSize(tester), const Size.square(16));
    expect(_trackSize(tester), const Size(40, 24));
  });
}
