import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final selectableTheme =
      ImpaktfullUiTheme.getDefault().components.selectableListItem;
  final check = selectableTheme.assets.check;

  Color? checkColor(WidgetTester tester) =>
      tester.widget<ImpaktfullUiAssetWidget>(findAsset(check)).color;

  testWidgets('onChanged is called with the inverted value', (tester) async {
    final changes = <bool>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSelectableListItem(
        title: 'Title',
        isSelected: false,
        onChanged: changes.add,
      ),
    );
    await tester.tap(find.text('Title'));
    expect(changes, [true]);
  });

  testWidgets('toggles when the parent updates isSelected', (tester) async {
    var isSelected = false;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiSelectableListItem(
          title: 'Title',
          isSelected: isSelected,
          onChanged: (value) => setState(() => isSelected = value),
        ),
      ),
    );
    expect(checkColor(tester), selectableTheme.colors.unselected);

    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(isSelected, isTrue);
    expect(checkColor(tester), selectableTheme.colors.selected);

    await tester.tap(find.text('Title'));
    await tester.pumpAndSettle();
    expect(isSelected, isFalse);
    expect(checkColor(tester), selectableTheme.colors.unselected);
  });

  testWidgets('animates the check color', (tester) async {
    var isSelected = false;
    late StateSetter setState;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setter) {
          setState = setter;
          return ImpaktfullUiSelectableListItem(
            title: 'Title',
            isSelected: isSelected,
            onChanged: (_) {},
          );
        },
      ),
    );
    setState(() => isSelected = true);
    await tester.pump();
    await tester.pump(selectableTheme.durations.color ~/ 2);
    final halfway = checkColor(tester);
    expect(halfway, isNot(selectableTheme.colors.unselected));
    expect(halfway, isNot(selectableTheme.colors.selected));
    await tester.pumpAndSettle();
    expect(checkColor(tester), selectableTheme.colors.selected);
  });

  testWidgets('without onChanged it cannot be tapped', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSelectableListItem(title: 'Title', isSelected: false),
    );
    expect(
      tester
          .widget<ImpaktfullUiTouchFeedback>(
            find.byType(ImpaktfullUiTouchFeedback),
          )
          .onTap,
      isNull,
    );
  });

  testWidgets('trailingBuilder replaces the check and gets isSelected',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSelectableListItem(
        title: 'Title',
        isSelected: true,
        trailingBuilder: (context, isSelected) => Text('Selected: $isSelected'),
        onChanged: (_) {},
      ),
    );
    expect(find.text('Selected: true'), findsOneWidget);
    expect(findAsset(check), findsNothing);
  });
}
