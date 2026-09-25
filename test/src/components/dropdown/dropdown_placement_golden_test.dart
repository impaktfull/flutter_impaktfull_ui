import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../_core_golden_helpers.dart';

/// The menu renders in the overlay of the app, so it is a screen golden: a
/// component golden would show the button without its menu.
///
/// The two cases of the screenshots that started this: a narrow button (its
/// items need room of their own) and a button low in the window (the menu
/// opens upwards instead of hanging out of it).
void main() {
  runScreenGoldenTest(
    fileName: 'impaktfull_ui_dropdown_placement',
    builder: () => Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImpaktfullUiDropdown<String>(
            buttonTitle: 'Item 0',
            child: _items(),
          ),
          const Spacer(),
          ImpaktfullUiDropdown<String>(
            buttonTitle: 'Item 0',
            alignment: ImpaktfullUiDropdownAlignment.bottomRight,
            child: _items(),
          ),
        ],
      ),
    ),
    pumpBeforeTest: (tester) async {
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ImpaktfullUiButton).last);
      await tester.pumpAndSettle();
    },
  );
}

Widget _items() => ImpaktfullUiListView<String>.builder(
      items: List.generate(6, (index) => 'Item $index'),
      itemBuilder: (context, item, index) =>
          ImpaktfullUiListItem(title: item, onTap: () {}),
      placeholderData:
          const ImpaktfullUiListViewPlaceholderData(title: 'No data'),
      shrinkWrap: true,
    );
