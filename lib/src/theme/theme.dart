import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/theme/theme_configurator.dart';
import 'package:impaktfull_ui/src/theme/asset_theme.dart';
import 'package:impaktfull_ui/src/theme/color_theme.dart';
import 'package:impaktfull_ui/src/theme/component_theme.dart';
import 'package:impaktfull_ui/src/theme/dimens_theme.dart';
import 'package:impaktfull_ui/src/theme/duration_theme.dart';
import 'package:impaktfull_ui/src/theme/shadow_theme.dart';
import 'package:impaktfull_ui/src/theme/textstyle_theme.dart';
import 'package:impaktfull_ui/src/theme/theme_default.dart';

export 'asset_theme.dart';
export 'color_theme.dart';
export 'component_theme.dart';
export 'dimens_theme.dart';
export 'duration_theme.dart';
export 'shadow_theme.dart';
export 'textstyle_theme.dart';
export 'theme_configurator.dart';
export 'theme_default.dart';

class ImpaktfullUiTheme<T extends Object> {
  static const _packageName = 'impaktfull_ui';

  final String? label;
  final ImpaktfullUiAssetTheme assets;
  final ImpaktfullUiColorTheme colors;
  final ImpaktfullUiTextStylesTheme textStyles;
  final ImpaktfullUiDimensTheme dimens;
  final ImpaktfullUiDurationTheme durations;
  final ImpaktfullUiShadowsTheme shadows;
  final ImpaktfullUiComponentsTheme components;
  final T? _customTheme;

  T get customTheme {
    final theme = customThemeOrNull;
    if (theme == null) {
      throw Exception('customTheme is not set on the ImpaktfullUiTheme');
    }
    return theme;
  }

  T? get customThemeOrNull => _customTheme;

  const ImpaktfullUiTheme({
    required this.label,
    required this.assets,
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.shadows,
    required this.components,
    T? customTheme,
  }) : _customTheme = customTheme;

  static ImpaktfullUiTheme<T> custom<T extends Object>({
    String? label,
    required Color primary,
    required Color accent,
    required Color secondary,
    Color? tertiary,
    Color? canvas,
    Color? card,
    Color? border,
    Color? shadow,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
    Color? textOnAccent,
    Color? textOnSecondary,
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    String fontFamilyDisplay = 'Ubuntu',
    String fontFamilyText = 'Geologica',
    String? package = _packageName,
    String? assetSuffix,
    T? customTheme,
  }) =>
      DefaultTheme.withMinimalChanges<T>(
        label: label,
        primary: primary,
        accent: accent,
        secondary: secondary,
        tertiary: tertiary,
        canvas: canvas,
        card: card,
        border: border,
        shadow: shadow,
        text: text,
        textSecondary: textSecondary,
        textTertiary: textTertiary,
        textOnAccent: textOnAccent,
        textOnSecondary: textOnSecondary,
        borderRadius: borderRadius,
        borderRadiusExtraSmall: borderRadiusExtraSmall,
        borderRadiusSmall: borderRadiusSmall,
        borderRadiusLarge: borderRadiusLarge,
        borderRadiusExtraLarge: borderRadiusExtraLarge,
        package: package,
        assetSuffix: assetSuffix,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
        customTheme: customTheme,
      );

  static ImpaktfullUiTheme<T> getDefault<T extends Object>({
    String? package = _packageName,
    String? assetSuffix,
    T? customTheme,
  }) =>
      DefaultTheme.withMinimalChanges<T>(
        label: 'Impaktfull Theme',
        primary: const Color(0xFF1A1A1A),
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        package: package,
        customTheme: customTheme,
      );

  static ImpaktfullUiTheme<T> of<T extends Object>(BuildContext context) {
    final theme = ImpaktfullUiThemeConfigurator.of(context).theme;
    if (theme.customThemeOrNull == null) {
      return theme as ImpaktfullUiTheme<T>;
    }
    if (theme.customTheme is T) {
      return theme as ImpaktfullUiTheme<T>;
    }
    throw Exception('Custom theme is not of type $T');
  }

  ImpaktfullUiTheme<T> copyWith({
    String? label,
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    ImpaktfullUiComponentsTheme? components,
    T? customTheme,
  }) =>
      ImpaktfullUiTheme<T>(
        label: label ?? this.label,
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        textStyles: textStyles ?? this.textStyles,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? this.shadows,
        components: components ?? this.components,
        customTheme: customTheme ?? this.customTheme,
      );
}
