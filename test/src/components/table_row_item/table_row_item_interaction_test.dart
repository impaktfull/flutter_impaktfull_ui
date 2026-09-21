import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  testWidgets('text: onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiTableRowItem.text(
        title: 'Title',
        subtitle: 'Subtitle',
        onTap: () => taps++,
      ),
    );
    expect(find.text('Subtitle'), findsOneWidget);
    await tester.tap(find.text('Title'));
    expect(taps, 1);
  });

  testWidgets('text: long texts are truncated on one line', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const SizedBox(
        width: 200,
        child: ImpaktfullUiTableRowItem.text(title: longText),
      ),
    );
    final text = tester.widget<Text>(find.text(longText));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    expect(tester.takeException(), isNull);
  });

  testWidgets('checkbox: the checkbox follows the parent', (tester) async {
    var isSelected = false;
    await pumpAndSettleComponent(
      tester,
      StatefulBuilder(
        builder: (context, setState) => ImpaktfullUiTableRowItem.checkbox(
          title: 'Title',
          isSelected: isSelected,
          onChanged: (value) => setState(() => isSelected = value),
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    await tester.pumpAndSettle();
    expect(isSelected, isTrue);
    expect(
      tester
          .widget<ImpaktfullUiCheckbox>(find.byType(ImpaktfullUiCheckbox))
          .value,
      isTrue,
    );
    await tester.tap(find.byType(ImpaktfullUiCheckbox));
    await tester.pumpAndSettle();
    expect(isSelected, isFalse);
  });

  testWidgets('badge: uses the badge type, primary by default', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Column(
        children: [
          ImpaktfullUiTableRowItem.badge(title: 'Default'),
          ImpaktfullUiTableRowItem.badge(
            title: 'Error',
            badgeType: ImpaktfullUiBadgeType.error,
          ),
        ],
      ),
    );
    final badges = tester
        .widgetList<ImpaktfullUiBadge>(find.byType(ImpaktfullUiBadge))
        .toList();
    expect(badges.map((badge) => badge.type), [
      ImpaktfullUiBadgeType.primary,
      ImpaktfullUiBadgeType.error,
    ]);
    expect(badges.map((badge) => badge.label), ['Default', 'Error']);
  });

  for (final title in [null, '']) {
    testWidgets('badge: no badge without a title ($title)', (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiTableRowItem.badge(title: title),
      );
      expect(find.byType(ImpaktfullUiBadge), findsNothing);
    });
  }

  testWidgets('custom: the builder gets the component theme', (tester) async {
    ImpaktfullUiTableRowItemTheme? builderTheme;
    final defaultTheme = ImpaktfullUiTheme.getDefault().components.tableRowItem;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiTableRowItem.custom(
        theme: defaultTheme,
        builder: (context, theme) {
          builderTheme = theme;
          return const Text('Custom');
        },
      ),
    );
    expect(find.text('Custom'), findsOneWidget);
    expect(builderTheme, same(defaultTheme));
  });

  testWidgets(
    'custom: uses the padding that is passed',
    (tester) async {
      const padding = EdgeInsets.all(12);
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiTableRowItem.custom(
          padding: padding,
          builder: (context, theme) => const Text('Custom'),
        ),
      );
      expect(
        find.byWidgetPredicate(
          (widget) => widget is Padding && widget.padding == padding,
        ),
        findsOneWidget,
      );
    },
  );

  testWidgets(
    'checkbox without a title fits the same column as the header checkbox',
    (tester) async {
      await pumpAndSettleComponent(
        tester,
        Column(
          children: [
            SizedBox(
              width: 56,
              child: ImpaktfullUiTableHeaderItem.checkbox(
                isSelected: false,
                onChanged: (_) {},
              ),
            ),
            SizedBox(
              width: 56,
              child: ImpaktfullUiTableRowItem.checkbox(
                isSelected: false,
                onChanged: (_) {},
              ),
            ),
          ],
        ),
      );
      expect(tester.takeException(), isNull);
    },
  );
}
