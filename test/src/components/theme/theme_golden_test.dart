import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

import '../../../util/golden_test_util.dart';
import '../../../util/golden_test_variant.dart';

void main() {
  setUp(() => setupComponentTest());

  final defaultTheme = ImpaktfullUiTheme.getDefault();
  final customTheme = defaultTheme.copyWith(
    colors: defaultTheme.colors.copyWith(
      accent: Colors.teal,
      primary: Colors.teal,
    ),
  );

  Widget swatches() => ImpaktfullUiThemeBuilder(
        builder: (context, theme) => Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              for (final color in [
                theme.colors.accent,
                theme.colors.primary,
                theme.colors.card,
                theme.colors.text,
                theme.colors.error,
                theme.colors.success,
              ])
                Container(width: 24, height: 24, color: color),
            ],
          ),
        ),
      );

  Widget badge() => ImpaktfullUiComponentThemeBuilder<ImpaktfullUiBadgeTheme>(
        builder: (context, componentTheme) => Padding(
          padding: const EdgeInsets.all(8),
          child: ImpaktfullUiBadge(
            type: ImpaktfullUiBadgeType.primary,
            label: 'Badge',
            theme: componentTheme,
          ),
        ),
      );

  runComponentTest(
    fileName: 'impaktfull_ui_theme_builder',
    columns: 2,
    goldenTests: () => [
      GoldenTest(
        description: 'ThemeBuilder: default theme',
        child: swatches(),
      ),
      GoldenTest(
        description: 'ThemeBuilder: custom theme',
        child: ImpaktfullUiApp(
          showDebugFlag: false,
          title: 'impaktfull app',
          impaktfullUiTheme: customTheme,
          home: ImpaktfullUiContainer(
            color: Colors.transparent,
            child: swatches(),
          ),
        ),
      ),
      GoldenTest(
        description: 'ComponentThemeBuilder: default theme',
        child: badge(),
      ),
      GoldenTest(
        description: 'ComponentThemeBuilder: override',
        child: ImpaktfullUiComponentThemeBuilder<ImpaktfullUiBadgeTheme>(
          overrideComponentTheme: ImpaktfullUiBadgeTheme(
            assets: defaultTheme.components.badge.assets,
            colors: defaultTheme.components.badge.colors,
            dimens: defaultTheme.components.badge.dimens,
            textStyles: ImpaktfullUiBadgeTextStylesTheme(
              small: defaultTheme.components.badge.textStyles.small
                  .copyWith(fontSize: 20),
              medium: defaultTheme.components.badge.textStyles.medium,
              large: defaultTheme.components.badge.textStyles.large,
            ),
          ),
          builder: (context, componentTheme) => Padding(
            padding: const EdgeInsets.all(8),
            child: ImpaktfullUiBadge(
              type: ImpaktfullUiBadgeType.primary,
              label: 'Badge',
              theme: componentTheme,
            ),
          ),
        ),
      ),
    ],
  );
}
