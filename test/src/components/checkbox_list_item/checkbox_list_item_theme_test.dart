import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_test_helpers.dart';

/// The checkbox of a list item is built without a `theme`, so it follows the
/// `ImpaktfullUiCheckboxTheme` of the app: a theme that resizes the checkbox
/// resizes the one in the list item too.

ImpaktfullUiTheme _themeWithCheckboxSize(double size) {
  final theme = ImpaktfullUiTheme.getDefault();
  final checkbox = theme.components.checkbox;
  return theme.copyWith(
    components: theme.components.copyWith(
      checkbox: checkbox.copyWith(
        dimens: checkbox.dimens.copyWith(size: size, iconSize: 14),
      ),
    ),
  );
}

Size _checkboxSize(WidgetTester tester) => tester.getSize(
      find
          .descendant(
            of: find.byType(ImpaktfullUiCheckbox),
            matching: find.byType(SizedBox),
          )
          .first,
    );

void main() {
  testWidgets('the checkbox of a list item follows the checkbox theme',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiCheckboxListItem(
        title: 'Accept the terms',
        value: true,
        onChanged: (_) {},
      ),
      theme: _themeWithCheckboxSize(16),
    );
    expect(_checkboxSize(tester), const Size.square(16));
  });

  testWidgets(
      'the checkbox of an indeterminate list item follows the checkbox theme',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiCheckboxListItem.indeterminate(
        title: 'Accept the terms',
        value: null,
        onChanged: (_) {},
      ),
      theme: _themeWithCheckboxSize(16),
    );
    expect(_checkboxSize(tester), const Size.square(16));
  });

  testWidgets('the checkbox of a list item keeps its own size by default',
      (tester) async {
    await pumpImpaktfullUiApp(
      tester,
      ImpaktfullUiCheckboxListItem(
        title: 'Accept the terms',
        value: true,
        onChanged: (_) {},
      ),
    );
    expect(_checkboxSize(tester), const Size.square(24));
  });
}
