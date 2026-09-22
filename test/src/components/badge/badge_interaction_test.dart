import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final badgeTheme = ImpaktfullUiTheme.getDefault().components.badge;

  testWidgets('onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          onTap: () => taps++,
        ),
      ),
    );
    await tester.tap(find.text('Badge'));
    expect(taps, 1);
  });

  testWidgets('onCloseTapped is called when the close icon is tapped',
      (tester) async {
    var taps = 0;
    var closeTaps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          onTap: () => taps++,
          onCloseTapped: () => closeTaps++,
        ),
      ),
    );
    await tester.tap(findAsset(badgeTheme.assets.close));
    expect(closeTaps, 1);
    expect(taps, 0);
  });

  testWidgets('the close icon replaces the trailing asset', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          trailingAsset: testIcon2,
          onCloseTapped: () {},
        ),
      ),
    );
    expect(findAsset(badgeTheme.assets.close), findsOneWidget);
    expect(findAsset(testIcon2), findsNothing);
  });

  for (final size in ImpaktfullUiBadgeSize.values) {
    testWidgets('$size: leading and trailing assets get the widget size',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            title: 'Badge',
            size: size,
            leadingAsset: testIcon,
            trailingAsset: testIcon2,
          ),
        ),
      );
      for (final asset in [testIcon, testIcon2]) {
        final widget = tester.widget<ImpaktfullUiAssetWidget>(findAsset(asset));
        expect(widget.size, size.widgetSize);
      }
    });
  }

  final textColors = {
    ImpaktfullUiBadgeType.primary: badgeTheme.colors.primaryText,
    ImpaktfullUiBadgeType.secondary: badgeTheme.colors.secondaryText,
    ImpaktfullUiBadgeType.error: badgeTheme.colors.errorText,
    ImpaktfullUiBadgeType.warning: badgeTheme.colors.warningText,
    ImpaktfullUiBadgeType.success: badgeTheme.colors.successText,
    ImpaktfullUiBadgeType.neutral: badgeTheme.colors.neutralText,
  };
  for (final MapEntry(key: type, value: color) in textColors.entries) {
    testWidgets('$type uses its own text color', (tester) async {
      await pumpAndSettleComponent(
        tester,
        Center(child: ImpaktfullUiBadge(type: type, title: 'Badge')),
      );
      expect(tester.widget<Text>(find.text('Badge')).style?.color, color);
    });
  }

  testWidgets('a custom badge widget is not resized or recolored',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          leading: ImpaktfullUiCustomBadgeWidget(
            child: SizedBox(width: 40, height: 10),
          ),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(ImpaktfullUiCustomBadgeWidget)),
      const Size(40, 10),
    );
  });

  testWidgets('other leading widgets get the widget size', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          title: 'Badge',
          size: ImpaktfullUiBadgeSize.large,
          leading: ColoredBox(color: Colors.red),
        ),
      ),
    );
    expect(
      tester.getSize(find.byType(ColoredBox).last),
      Size.square(ImpaktfullUiBadgeSize.large.widgetSize),
    );
  });

  testWidgets('a long label in a bounded width is truncated on one line',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: SizedBox(
          width: 150,
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            title: longText,
            leadingAsset: testIcon,
            onCloseTapped: () {},
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    final text = tester.widget<Text>(find.text(longText));
    expect(text.maxLines, 1);
    expect(text.overflow, TextOverflow.ellipsis);
    expect(tester.getSize(find.byType(ImpaktfullUiBadge)).width,
        lessThanOrEqualTo(150));
  });

  testWidgets('a short label in a bounded width keeps its own width',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const Center(
        child: SizedBox(
          width: 300,
          child: Align(
            alignment: AlignmentDirectional.centerStart,
            child: ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              title: 'Badge',
            ),
          ),
        ),
      ),
    );
    expect(tester.getSize(find.byType(ImpaktfullUiBadge)).width, lessThan(100));
  });

  testWidgets('in an unbounded width (a Row) the badge keeps its width',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              title: longText,
            ),
          ],
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    // The full label is shown, wider than the screen.
    expect(
        tester.getSize(find.byType(ImpaktfullUiBadge)).width, greaterThan(800));
  });
}
