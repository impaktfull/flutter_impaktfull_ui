import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../_data_display_test_helpers.dart';

void main() {
  final skeletonTheme = ImpaktfullUiTheme.getDefault().components.skeleton;

  Future<void> pumpSkeleton(WidgetTester tester, Widget skeleton) => pumpSized(
        tester,
        Align(
          alignment: AlignmentDirectional.topStart,
          child: SizedBox(
            width: 200,
            height: 100,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: skeleton,
            ),
          ),
        ),
        settle: false,
      );

  Alignment shimmerAlignment(WidgetTester tester) => tester
      .widget<FractionallySizedBox>(find.descendant(
        of: find.byType(ImpaktfullUiSkeleton),
        matching: find.byType(FractionallySizedBox),
      ))
      .alignment
      .resolve(TextDirection.ltr);

  /// The colours of the gradient that sweeps over the skeleton.
  List<Color> shimmerColors(WidgetTester tester) {
    final container = tester.widget<Container>(find.descendant(
      of: find.byType(FractionallySizedBox),
      matching: find.byType(Container),
    ));
    final gradient = (container.decoration as BoxDecoration).gradient!;
    return gradient.colors;
  }

  testWidgets('box has the size that is passed', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.box(width: 120, height: 40),
    );
    expect(
        tester.getSize(find.byType(ImpaktfullUiSkeleton)), const Size(120, 40));
  });

  testWidgets('circle is fully rounded', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.circle(width: 40, height: 40),
    );
    final container = tester.widget<Container>(find
        .descendant(
          of: find.byType(ImpaktfullUiSkeleton),
          matching: find.byType(Container),
        )
        .first);
    expect(
      (container.decoration as BoxDecoration).borderRadius,
      const BorderRadius.all(Radius.circular(99999)),
    );
  });

  testWidgets('factor uses a part of the available size', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.factor(widthFactor: 0.5, heightFactor: 0.25),
    );
    expect(
        tester.getSize(find.byType(ImpaktfullUiSkeleton)), const Size(100, 25));
  });

  testWidgets('factor with a fixed height uses the full width', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.factor(height: 12),
    );
    expect(
        tester.getSize(find.byType(ImpaktfullUiSkeleton)), const Size(200, 12));
  });

  testWidgets('uses the colors and border radius of the theme', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.box(width: 120, height: 40),
    );
    final decoration = tester
        .widget<Container>(find
            .descendant(
              of: find.byType(ImpaktfullUiSkeleton),
              matching: find.byType(Container),
            )
            .first)
        .decoration as BoxDecoration;
    expect(decoration.color, skeletonTheme.colors.background);
    expect(decoration.borderRadius, skeletonTheme.dimens.borderRadius);
  });

  testWidgets('the shimmer moves and repeats (fake time)', (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.box(width: 120, height: 40),
    );
    expect(shimmerAlignment(tester).x, -3);
    await tester.pump(const Duration(milliseconds: 750));
    expect(shimmerAlignment(tester).x, closeTo(0, 0.01));
    await tester.pump(const Duration(milliseconds: 750));
    // Back at the start: the animation repeats.
    expect(shimmerAlignment(tester).x, closeTo(-3, 0.01));
    expect(tester.binding.hasScheduledFrame, isTrue);
  });

  testWidgets('a disabled TickerMode freezes the shimmer', (tester) async {
    await pumpSkeleton(
      tester,
      frozen(const ImpaktfullUiSkeleton.box(width: 120, height: 40)),
    );
    await tester.pump(const Duration(milliseconds: 750));
    expect(shimmerAlignment(tester).x, -3);
  });

  testWidgets('the shimmer is drawn with the highlight of the theme',
      (tester) async {
    await pumpSkeleton(
      tester,
      const ImpaktfullUiSkeleton.box(width: 120, height: 40),
    );
    final highlight = skeletonTheme.colors.highlight;
    expect(
      shimmerColors(tester),
      [highlight.withAlpha(0), highlight, highlight.withAlpha(0)],
    );
  });

  testWidgets('the default highlight is visible on the background',
      (tester) async {
    // A shimmer in the colour of the background it sweeps over would not be
    // visible at all: the default highlight has to differ from it.
    expect(
      skeletonTheme.colors.highlight,
      isNot(skeletonTheme.colors.background),
    );
  });

  testWidgets('a highlight from the theme is used for the shimmer',
      (tester) async {
    const highlight = Color(0xFF00FF00);
    await pumpSkeleton(
      tester,
      ImpaktfullUiSkeleton.box(
        width: 120,
        height: 40,
        theme: skeletonTheme.copyWith(
          colors: skeletonTheme.colors.copyWith(highlight: highlight),
        ),
      ),
    );
    expect(
      shimmerColors(tester),
      const [Color(0x0000FF00), highlight, Color(0x0000FF00)],
    );
  });

  testWidgets('the shimmer duration comes from the theme', (tester) async {
    await pumpSkeleton(
      tester,
      ImpaktfullUiSkeleton.box(
        width: 120,
        height: 40,
        theme: skeletonTheme.copyWith(
          durations: const ImpaktfullUiSkeletonDurationsTheme(
            shimmer: Duration(seconds: 4),
          ),
        ),
      ),
    );
    expect(shimmerAlignment(tester).x, -3);
    // Half of the default duration: with a sweep of 4 seconds the shimmer is
    // only a quarter of the way.
    await tester.pump(const Duration(milliseconds: 750));
    expect(shimmerAlignment(tester).x, closeTo(-1.875, 0.01));
    await tester.pump(const Duration(milliseconds: 1250));
    expect(shimmerAlignment(tester).x, closeTo(0, 0.01));
  });
}
