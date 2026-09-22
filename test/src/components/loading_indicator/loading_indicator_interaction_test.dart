import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';
import 'package:lottie/lottie.dart';

import '../../../util/test_util.dart';

void main() {
  final defaultTheme =
      ImpaktfullUiTheme.getDefault().components.loadingIndicator;
  final circularTheme = ImpaktfullUiLoadingIndicatorTheme(
    assets: const ImpaktfullUiLoadingIndicatorAssetsTheme(lottie: null),
    colors: defaultTheme.colors,
    dimens: defaultTheme.dimens,
  );

  testWidgets('shows the lottie of the theme by default', (tester) async {
    await pumpComponent(tester, const ImpaktfullUiLoadingIndicator());
    expect(find.byType(Lottie), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(ColorFiltered), findsNothing);
  });

  testWidgets('a color is applied to the lottie with a color filter',
      (tester) async {
    await pumpComponent(
      tester,
      const ImpaktfullUiLoadingIndicator(color: Colors.red),
    );
    final colorFiltered = tester.widget<ColorFiltered>(
      find.byType(ColorFiltered),
    );
    expect(
      colorFiltered.colorFilter,
      const ColorFilter.mode(Colors.red, BlendMode.srcATop),
    );
  });

  testWidgets('custom shows the asset that is passed', (tester) async {
    const asset = ImpaktfullUiAsset.lottie(
      'loading.json',
      directory: 'assets/lottie',
    );
    await pumpComponent(
      tester,
      const ImpaktfullUiLoadingIndicator.custom(asset: asset),
    );
    final assetWidget = tester.widget<ImpaktfullUiAssetWidget>(
      find.byType(ImpaktfullUiAssetWidget),
    );
    expect(assetWidget.asset, asset);
    expect(assetWidget.width, 48);
    expect(assetWidget.height, 48);
  });

  testWidgets('without a lottie a CircularProgressIndicator is shown',
      (tester) async {
    await pumpComponent(
      tester,
      ImpaktfullUiLoadingIndicator(theme: circularTheme),
    );
    final indicator = tester.widget<CircularProgressIndicator>(
      find.byType(CircularProgressIndicator),
    );
    expect(indicator.color, defaultTheme.colors.color);
    expect(indicator.strokeWidth, defaultTheme.dimens.strokeWidth);
    expect(indicator.value, isNull);
  });

  testWidgets('the color replaces the color of the theme', (tester) async {
    await pumpComponent(
      tester,
      ImpaktfullUiLoadingIndicator(theme: circularTheme, color: Colors.green),
    );
    expect(
      tester
          .widget<CircularProgressIndicator>(
            find.byType(CircularProgressIndicator),
          )
          .color,
      Colors.green,
    );
  });

  testWidgets('keeps animating', (tester) async {
    await pumpComponent(
      tester,
      ImpaktfullUiLoadingIndicator(theme: circularTheme),
    );
    await tester.pump(const Duration(seconds: 10));
    expect(tester.binding.hasScheduledFrame, isTrue);
  });
}
