import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';

void main() {
  const interval = Duration(seconds: 1);
  final items = [
    for (var i = 0; i < 3; i++) Text('Page $i'),
  ];

  Future<void> disposeCarousel(WidgetTester tester) async {
    // Stops the autoplay timer.
    await tester.pumpWidget(const SizedBox());
  }

  testWidgets('autoplay with loop jumps from the last to the first page',
      (tester) async {
    final changes = <int>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCarousel(
        items: items,
        index: 2,
        autoplay: true,
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    await tester.pump(interval);
    // Small steps, so every page the animation passes is reported.
    await tester.pumpAndSettle(const Duration(milliseconds: 16));
    expect(changes, [0]);
    expect(find.text('Page 0'), findsOneWidget);
    await disposeCarousel(tester);
  });

  testWidgets('autoplay pauses while the user drags', (tester) async {
    final changes = <int>[];
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCarousel(
        items: items,
        autoplay: true,
        autoplayInterval: interval,
        onItemChanged: changes.add,
      ),
    );
    final gesture =
        await tester.startGesture(tester.getCenter(find.text('Page 0')));
    await gesture.moveBy(const Offset(-20, 0));
    await tester.pump();
    await gesture.moveBy(const Offset(-20, 0));
    await tester.pump();

    // Holding the page for longer than the autoplay interval.
    await tester.pump(interval * 2);
    await tester.pumpAndSettle();
    expect(changes, isEmpty);

    await gesture.moveBy(const Offset(20, 0));
    await gesture.up();
    await tester.pumpAndSettle();
    expect(changes, isEmpty);

    // Autoplay starts again after the user lets go.
    await tester.pump(interval);
    await tester.pumpAndSettle();
    expect(changes, [1]);
    await disposeCarousel(tester);
  });

  testWidgets('uses indicatorPadding of the theme', (tester) async {
    final defaultTheme = ImpaktfullUiTheme.getDefault().components.carousel;
    const indicatorPadding = EdgeInsets.all(20);
    await pumpAndSettleComponent(
      tester,
      ImpaktfullUiCarousel(
        items: items,
        theme: ImpaktfullUiCarouselTheme(
          assets: defaultTheme.assets,
          colors: defaultTheme.colors,
          dimens: ImpaktfullUiCarouselDimensTheme(
            indicatorBorderRadius: defaultTheme.dimens.indicatorBorderRadius,
            indicatorPadding: indicatorPadding,
            indicatorSize: defaultTheme.dimens.indicatorSize,
            indicatorSpacing: defaultTheme.dimens.indicatorSpacing,
          ),
          textStyles: defaultTheme.textStyles,
        ),
      ),
    );
    expect(
      find.byWidgetPredicate(
        (widget) => widget is Padding && widget.padding == indicatorPadding,
      ),
      findsOneWidget,
    );
  });
}
