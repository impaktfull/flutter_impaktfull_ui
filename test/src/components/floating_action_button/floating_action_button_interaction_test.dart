import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/font_loader.dart';
import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  double labelWidth(WidgetTester tester) => tester
      .getSize(find
          .ancestor(of: find.byType(Text), matching: find.byType(ClipRect))
          .first)
      .width;

  testWidgets('onTap is called when tapped', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiFloatingActionButton(
          asset: customTestAsset,
          onTap: () => taps++,
        ),
      ),
    );
    await tester.tap(find.byType(ImpaktfullUiFloatingActionButton));
    await tester.pump();
    expect(taps, 1);
  });

  testWidgets('without onTap the disabled background is used', (tester) async {
    final theme = defaultComponentsTheme.floatingActionButton;
    await pumpAndSettleComponent(
      tester,
      Center(child: ImpaktfullUiFloatingActionButton(asset: customTestAsset)),
    );
    final touchFeedback = tester.widget<ImpaktfullUiTouchFeedback>(
        find.byType(ImpaktfullUiTouchFeedback));
    expect(touchFeedback.onTap, isNull);
    expect(touchFeedback.color, theme.colors.backgroundDisabled);
    await tester.tap(find.byType(ImpaktfullUiFloatingActionButton),
        warnIfMissed: false);
    await tester.pump();
    expect(tester.takeException(), isNull);
  });

  test('expanded is false without a label', () {
    final fab = ImpaktfullUiFloatingActionButton(
      asset: customTestAsset,
      expanded: true,
    );
    expect(fab.expanded, isFalse);
  });

  testWidgets('the label is hidden when collapsed', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiFloatingActionButton(
          asset: customTestAsset,
          label: 'Add',
          onTap: () {},
        ),
      ),
    );
    expect(labelWidth(tester), 0);
  });

  testWidgets('expanded from the parent animates the label in and out',
      (tester) async {
    final expanded = ValueNotifier(false);
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ValueListenableBuilder<bool>(
          valueListenable: expanded,
          builder: (context, isExpanded, child) =>
              ImpaktfullUiFloatingActionButton(
            asset: customTestAsset,
            label: 'Add',
            expanded: isExpanded,
            onTap: () {},
          ),
        ),
      ),
    );
    expect(labelWidth(tester), 0);

    expanded.value = true;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));
    final halfway = labelWidth(tester);
    expect(halfway, greaterThan(0));
    await tester.pumpAndSettle();
    final fullWidth = labelWidth(tester);
    expect(fullWidth, greaterThan(halfway));

    expanded.value = false;
    await tester.pumpAndSettle();
    expect(labelWidth(tester), 0);
  });

  group(
    'label width',
    () {
      testWidgets('a long expanded label is not clipped', (tester) async {
        await loadImpaktfullUiFonts();
        const label = 'A very long label for a floating action button';
        await pumpAndSettleComponent(
          tester,
          Center(
            child: ImpaktfullUiFloatingActionButton(
              asset: customTestAsset,
              label: label,
              expanded: true,
              onTap: () {},
            ),
          ),
        );
        final paragraph = tester.renderObject<RenderParagraph>(
          find.text(label),
        );
        expect(
          paragraph.size.width,
          greaterThanOrEqualTo(
              paragraph.getMaxIntrinsicWidth(double.infinity).floor()),
        );
      });
    },
  );

  testWidgets('the label is used as tooltip', (tester) async {
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiFloatingActionButton(
          asset: customTestAsset,
          label: 'Add',
          onTap: () {},
        ),
      ),
    );
    expect(
      tester
          .widget<ImpaktfullUiTouchFeedback>(
              find.byType(ImpaktfullUiTouchFeedback))
          .tooltip,
      'Add',
    );
  });

  testWidgets('enter activates the focused button', (tester) async {
    var taps = 0;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiFloatingActionButton(
          asset: customTestAsset,
          onTap: () => taps++,
        ),
      ),
    );
    await tester.sendKeyEvent(LogicalKeyboardKey.tab);
    await tester.pump();
    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();
    expect(taps, 1);
  });

  testWidgets('the theme override is used', (tester) async {
    final theme = defaultComponentsTheme.floatingActionButton;
    await pumpAndSettleComponent(
      tester,
      Center(
        child: ImpaktfullUiFloatingActionButton(
          asset: customTestAsset,
          onTap: () {},
          theme: theme.copyWith(
            colors: theme.colors.copyWith(
              background: customTestColor,
              icon: Colors.black,
            ),
          ),
        ),
      ),
    );
    expect(
      tester
          .widget<ImpaktfullUiTouchFeedback>(
              find.byType(ImpaktfullUiTouchFeedback))
          .color,
      customTestColor,
    );
    expect(
      tester
          .widget<ImpaktfullUiAssetWidget>(
              find.byWidgetPredicate(isAssetWidget(customTestAsset)))
          .color,
      Colors.black,
    );
  });
}
