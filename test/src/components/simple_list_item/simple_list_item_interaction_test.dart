import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_data_display_test_helpers.dart';

void main() {
  final simpleListItemTheme =
      ImpaktfullUiTheme.getDefault().components.simpleListItem;

  testWidgets('onTap is called on tap', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSimpleListItem(title: 'Title', onTap: () => taps++),
    );
    await tester.tap(find.text('Title'));
    expect(taps, 1);
  });

  testWidgets('shows the title and subtitle', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSimpleListItem(title: 'Title', subtitle: 'Subtitle'),
    );
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Subtitle'), findsOneWidget);
  });

  testWidgets('a center builder replaces the title and subtitle',
      (tester) async {
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSimpleListItem(
        title: 'Title',
        subtitle: 'Subtitle',
        centerWidgetBuilder: (context) => const Text('Center'),
      ),
    );
    expect(find.text('Center'), findsOneWidget);
    expect(find.text('Title'), findsNothing);
    expect(find.text('Subtitle'), findsNothing);
  });

  for (final (type, color) in [
    (
      ImpaktfullUiSimpleListItemType.neutral,
      simpleListItemTheme.textStyles.title.color,
    ),
    (
      ImpaktfullUiSimpleListItemType.danger,
      simpleListItemTheme.textStyles.titleDanger.color,
    ),
  ]) {
    testWidgets('$type: asset widgets without a color get the title color',
        (tester) async {
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiSimpleListItem(
          title: 'Title',
          type: type,
          leadingWidgetBuilder: (context) =>
              ImpaktfullUiAssetWidget(asset: testIcon, size: 20),
          trailingWidgetBuilder: (context) => ImpaktfullUiAssetWidget(
            asset: testIcon2,
            color: Colors.orange,
          ),
        ),
      );
      final leading =
          tester.widget<ImpaktfullUiAssetWidget>(findAsset(testIcon));
      expect(leading.color, color);
      expect(leading.size, 20);
      // An explicit color is kept.
      expect(
        tester.widget<ImpaktfullUiAssetWidget>(findAsset(testIcon2)).color,
        Colors.orange,
      );
    });
  }

  testWidgets('uses the padding and border radius that are passed',
      (tester) async {
    const padding = EdgeInsets.all(21);
    const borderRadius = BorderRadius.all(Radius.circular(3));
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiSimpleListItem(
        title: 'Title',
        padding: padding,
        borderRadius: borderRadius,
      ),
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == padding,
      ),
      findsOneWidget,
    );
    expect(
      tester
          .widget<ImpaktfullUiTouchFeedback>(
            find.byType(ImpaktfullUiTouchFeedback),
          )
          .borderRadius,
      borderRadius,
    );
  });

  testWidgets('custom constructor behaves the same', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiSimpleListItem.custom(
        title: 'Custom',
        onTap: () => taps++,
      ),
    );
    await tester.tap(find.text('Custom'));
    expect(taps, 1);
  });
}
