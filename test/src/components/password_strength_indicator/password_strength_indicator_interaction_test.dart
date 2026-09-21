import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/test_util.dart';
import '../_inputs_test_helpers.dart';

void main() {
  List<Color?> indicatorColors(WidgetTester tester) => tester
      .widgetList<AnimatedContainer>(find.byType(AnimatedContainer))
      .map((container) => (container.decoration as BoxDecoration?)?.color)
      .toList();

  const requirements = [
    ImpaktfullUiPasswordStrengthIndicatorRequirement(
      requirement: 'Met',
      isMet: true,
    ),
    ImpaktfullUiPasswordStrengthIndicatorRequirement(
      requirement: 'Not met',
      isMet: false,
    ),
  ];

  testWidgets('the default theme has 4 indicators', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiPasswordStrengthIndicator(
        strengthIndicatorIndex: null,
        requirements: [],
      ),
    );
    final theme = defaultComponentsTheme.passwordStrengthIndicator;
    expect(indicatorColors(tester),
        List.filled(4, theme.colors.strengthIndicatorBackground));
  });

  testWidgets('empty strengthIndicators does not throw', (tester) async {
    await pumpAndSettleComponent(
      tester,
      const ImpaktfullUiPasswordStrengthIndicator(
        strengthIndicatorIndex: 2,
        strengthIndicators: [],
        requirements: [],
      ),
    );
    expect(tester.takeException(), isNull);
    expect(indicatorColors(tester), isEmpty);
  });

  testWidgets('a new index from the parent animates to the new color',
      (tester) async {
    final index = ValueNotifier<int?>(null);
    await pumpAndSettleComponent(
      tester,
      ValueListenableBuilder<int?>(
        valueListenable: index,
        builder: (context, value, child) =>
            ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: value,
          strengthIndicators: const [Colors.red, Colors.green],
          requirements: const [],
        ),
      ),
    );
    expect(indicatorColors(tester), isNot(contains(Colors.red)));
    index.value = 0;
    await tester.pumpAndSettle();
    expect(indicatorColors(tester).first, Colors.red);
    index.value = 1;
    await tester.pumpAndSettle();
    expect(indicatorColors(tester), [Colors.green, Colors.green]);
  });

  group('requirements', () {
    testWidgets('are shown with the met and not met style', (tester) async {
      final theme = defaultComponentsTheme.passwordStrengthIndicator;
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          requirements: requirements,
        ),
      );
      expect(tester.widget<Text>(find.text('Met')).style,
          theme.textStyles.requirementIsMet);
      expect(tester.widget<Text>(find.text('Not met')).style,
          theme.textStyles.requirement);
      final assetColors = tester
          .widgetList<ImpaktfullUiAssetWidget>(
              find.byType(ImpaktfullUiAssetWidget))
          .map((asset) => asset.color)
          .toList();
      expect(assetColors, [
        theme.colors.requirementAssetIsMet,
        theme.colors.requirementAsset,
      ]);
    });

    testWidgets('an empty list shows no requirements', (tester) async {
      await pumpAndSettleComponent(
        tester,
        const ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          requirements: [],
        ),
      );
      expect(find.byType(Text), findsNothing);
    });
  });

  group('theme override', () {
    testWidgets('the colors and assets are used', (tester) async {
      final theme = defaultComponentsTheme.passwordStrengthIndicator;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          requirements: requirements,
          theme: theme.copyWith(
            assets: theme.assets.copyWith(
              leadingRequirementIsMet: customTestAsset,
            ),
            colors: theme.colors.copyWith(
              strengthIndicators: [customTestColor],
            ),
          ),
        ),
      );
      expect(indicatorColors(tester), [customTestColor]);
      expect(find.byWidgetPredicate(isAssetWidget(customTestAsset)),
          findsOneWidget);
    });

    testWidgets('without leading assets no icons are shown', (tester) async {
      final theme = defaultComponentsTheme.passwordStrengthIndicator;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          requirements: requirements,
          theme: theme.copyWith(
            assets: const ImpaktfullUiPasswordStrengthIndicatorAssetsTheme(),
          ),
        ),
      );
      expect(find.byType(ImpaktfullUiAssetWidget), findsNothing);
      expect(find.text('Met'), findsOneWidget);
    });

    testWidgets('strengthIndicators has priority over the theme',
        (tester) async {
      final theme = defaultComponentsTheme.passwordStrengthIndicator;
      await pumpAndSettleComponent(
        tester,
        ImpaktfullUiPasswordStrengthIndicator(
          strengthIndicatorIndex: 0,
          strengthIndicators: const [Colors.blue],
          requirements: const [],
          theme: theme.copyWith(
            colors: theme.colors.copyWith(
              strengthIndicators: [customTestColor, customTestColor],
            ),
          ),
        ),
      );
      expect(indicatorColors(tester), [Colors.blue]);
    });
  });
}
