import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:impaktfull_ui/impaktfull_ui.dart';

void main() {
  final defaultTheme = ImpaktfullUiTheme.getDefault();

  Future<void> pumpApp(
    WidgetTester tester,
    Widget child, {
    ImpaktfullUiTheme? theme,
  }) async {
    await tester.pumpWidget(
      ImpaktfullUiApp(
        showDebugFlag: false,
        title: 'impaktfull app',
        impaktfullUiTheme: theme,
        home: child,
      ),
    );
    await tester.pumpAndSettle();
  }

  testWidgets('ThemeBuilder gets the theme of the app', (tester) async {
    final customTheme = defaultTheme.copyWith(
      colors: defaultTheme.colors.copyWith(accent: Colors.teal),
    );
    ImpaktfullUiTheme? builderTheme;
    await pumpApp(
      tester,
      ImpaktfullUiThemeBuilder(
        builder: (context, theme) {
          builderTheme = theme;
          return const SizedBox();
        },
      ),
      theme: customTheme,
    );
    expect(builderTheme, same(customTheme));
    expect(builderTheme!.colors.accent, Colors.teal);
  });

  testWidgets('ThemeBuilder rebuilds when the theme of the app changes',
      (tester) async {
    final colors = <Color>[];
    Widget builder() => ImpaktfullUiThemeBuilder(
          builder: (context, theme) {
            colors.add(theme.colors.accent);
            return const SizedBox();
          },
        );
    await pumpApp(
      tester,
      builder(),
      theme: defaultTheme.copyWith(
        colors: defaultTheme.colors.copyWith(accent: Colors.red),
      ),
    );
    await pumpApp(
      tester,
      builder(),
      theme: defaultTheme.copyWith(
        colors: defaultTheme.colors.copyWith(accent: Colors.green),
      ),
    );
    expect(colors.first, Colors.red);
    expect(colors.last, Colors.green);
  });

  testWidgets('ComponentThemeBuilder gets the component theme of the app',
      (tester) async {
    ImpaktfullUiBadgeTheme? builderTheme;
    await pumpApp(
      tester,
      ImpaktfullUiComponentThemeBuilder<ImpaktfullUiBadgeTheme>(
        builder: (context, componentTheme) {
          builderTheme = componentTheme;
          return const SizedBox();
        },
      ),
      theme: defaultTheme,
    );
    expect(builderTheme, same(defaultTheme.components.badge));
  });

  testWidgets('ComponentThemeBuilder: an override wins', (tester) async {
    final badgeTheme = defaultTheme.components.badge;
    final override = ImpaktfullUiBadgeTheme(
      assets: badgeTheme.assets,
      colors: badgeTheme.colors,
      dimens: badgeTheme.dimens,
      textStyles: badgeTheme.textStyles,
    );
    ImpaktfullUiBadgeTheme? builderTheme;
    await pumpApp(
      tester,
      ImpaktfullUiComponentThemeBuilder<ImpaktfullUiBadgeTheme>(
        overrideComponentTheme: override,
        builder: (context, componentTheme) {
          builderTheme = componentTheme;
          return const SizedBox();
        },
      ),
    );
    expect(builderTheme, same(override));
  });

  testWidgets('a component uses the theme passed to it', (tester) async {
    final badgeTheme = defaultTheme.components.badge;
    final override = ImpaktfullUiBadgeTheme(
      assets: badgeTheme.assets,
      colors: badgeTheme.colors,
      dimens: badgeTheme.dimens,
      textStyles: ImpaktfullUiBadgeTextStylesTheme(
        small: badgeTheme.textStyles.small.copyWith(fontSize: 33),
        medium: badgeTheme.textStyles.medium,
        large: badgeTheme.textStyles.large,
      ),
    );
    await pumpApp(
      tester,
      Center(
        child: ImpaktfullUiBadge(
          type: ImpaktfullUiBadgeType.primary,
          label: 'Badge',
          theme: override,
        ),
      ),
    );
    expect(tester.widget<Text>(find.text('Badge')).style?.fontSize, 33);
  });
}
