import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

import '../../../util/test_util.dart';

void main() {
  testWidgets('onTap is called when the header is tapped (sorting)',
      (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiTableHeaderItem(title: 'Name', onTap: () => taps++),
    );
    await tester.tap(find.text('Name'));
    expect(taps, 1);
  });

  for (final (ascending, icon) in [
    (true, PhosphorIcons.caretUp),
    (false, PhosphorIcons.caretDown),
  ]) {
    testWidgets('ascending: $ascending shows the sort direction',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiTableHeaderItem(title: 'Name', ascending: ascending),
      );
      expect(find.byIcon(icon), findsOneWidget);
    });
  }

  testWidgets('ascending: null shows no sort direction', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableHeaderItem(title: 'Name'),
    );
    expect(find.byIcon(PhosphorIcons.caretUp), findsNothing);
    expect(find.byIcon(PhosphorIcons.caretDown), findsNothing);
  });

  testWidgets('the sort direction follows the parent', (tester) async {
    bool? ascending;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiTableHeaderItem(
          title: 'Name',
          ascending: ascending,
          onTap: () => setState(() => ascending = !(ascending ?? false)),
        ),
      ),
    );
    await tester.tap(find.textContaining('Name'));
    await tester.pumpAndSettle();
    expect(find.byIcon(PhosphorIcons.caretUp), findsOneWidget);
    await tester.tap(find.textContaining('Name'));
    await tester.pumpAndSettle();
    expect(find.byIcon(PhosphorIcons.caretDown), findsOneWidget);
  });

  for (final (isSelected, expected) in [
    (false, true),
    (null, true),
    (true, false),
  ]) {
    testWidgets('checkbox $isSelected: a tap reports $expected',
        (tester) async {
      final changes = <bool?>[];
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiTableHeaderItem.checkbox(
          title: 'Title',
          isSelected: isSelected,
          onChanged: changes.add,
        ),
      );
      final checkbox = tester.widget<ImpaktfullUiCheckbox>(
        find.byType(ImpaktfullUiCheckbox),
      );
      expect(checkbox.value, isSelected);
      expect(checkbox.type, ImpaktfullUiCheckboxType.indeterminate);
      await tester.tap(find.byType(ImpaktfullUiCheckbox));
      expect(changes, [expected]);
    });
  }

  testWidgets('a text header ignores isSelected', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableHeaderItem(title: 'Title'),
    );
    expect(find.byType(ImpaktfullUiCheckbox), findsNothing);
    expect(
      const ImpaktfullUiTableHeaderItem(title: 'Title').type,
      ImpaktfullUiTableHeaderItemType.text,
    );
  });

  testWidgets('uses the padding that is passed', (tester) async {
    const padding = EdgeInsets.all(3);
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiTableHeaderItem(title: 'Title', padding: padding),
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == padding,
      ),
      findsOneWidget,
    );
  });
}
