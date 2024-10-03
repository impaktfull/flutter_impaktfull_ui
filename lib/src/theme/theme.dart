import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/theme/asset_theme.dart';
import 'package:impaktfull_ui_2/src/theme/color_theme.dart';
import 'package:impaktfull_ui_2/src/theme/component_theme.dart';
import 'package:impaktfull_ui_2/src/theme/dimens_theme.dart';
import 'package:impaktfull_ui_2/src/theme/duration_theme.dart';
import 'package:impaktfull_ui_2/src/theme/shadow_theme.dart';
import 'package:impaktfull_ui_2/src/theme/textstyle_theme.dart';
import 'package:impaktfull_ui_2/src/theme/theme_configurator.dart';
import 'package:impaktfull_ui_2/src/theme/theme_default.dart';

export 'color_theme.dart';
export 'component_theme.dart';
export 'dimens_theme.dart';
export 'duration_theme.dart';
export 'shadow_theme.dart';
export 'textstyle_theme.dart';
export 'theme_configurator.dart';
export 'theme_default.dart';

class ImpaktfullUiTheme {
  final String? label;
  final ImpaktfullUiAssetTheme assets;
  final ImpaktfullUiColorTheme colors;
  final ImpaktfullUiTextStylesTheme textStyles;
  final ImpaktfullUiDimensTheme dimens;
  final ImpaktfullUiDurationTheme durations;
  final ImpaktfullUiShadowsTheme shadows;
  final ImpaktfullUiComponentsTheme components;

  const ImpaktfullUiTheme({
    required this.label,
    required this.assets,
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.shadows,
    required this.components,
  });

  static ImpaktfullUiTheme custom({
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
    Color? textOnAccent,
    Color? textOnSecondary,
    BorderRadius? borderRadiusExtraSmall,
    BorderRadius? borderRadiusSmall,
    BorderRadius? borderRadius,
    BorderRadius? borderRadiusLarge,
    BorderRadius? borderRadiusExtraLarge,
    String package = 'impaktfull_ui_2',
  }) =>
      DefaultTheme.withMinimalChanges(
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
        textOnAccent: textOnAccent,
        textOnSecondary: textOnSecondary,
        borderRadius: borderRadius,
        borderRadiusExtraSmall: borderRadiusExtraSmall,
        borderRadiusSmall: borderRadiusSmall,
        borderRadiusLarge: borderRadiusLarge,
        borderRadiusExtraLarge: borderRadiusExtraLarge,
      );

  static ImpaktfullUiTheme getDefault() => DefaultTheme.withMinimalChanges(
        label: 'Impaktfull Theme',
        primary: const Color(0xFF1A1A1A),
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
      );

  static ImpaktfullUiTheme of(BuildContext context) => theme;

  ImpaktfullUiTheme copyWith({
    String? label,
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    ImpaktfullUiComponentsTheme? components,
  }) =>
      ImpaktfullUiTheme(
        label: label ?? this.label,
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        textStyles: textStyles ?? this.textStyles,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? this.shadows,
        components: components ?? this.components,
      );
}
