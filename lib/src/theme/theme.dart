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
  final ImpaktfullUiAssetTheme assets;
  final ImpaktfullUiColorTheme colors;
  final ImpaktfullUiTextStylesTheme textStyles;
  final ImpaktfullUiDimensTheme dimens;
  final ImpaktfullUiDurationTheme durations;
  final ImpaktfullUiShadowsTheme shadows;
  final ImpaktfullUiComponentsTheme components;

  const ImpaktfullUiTheme({
    required this.assets,
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.shadows,
    required this.components,
  });

  static ImpaktfullUiTheme custom({
    required Color accent,
    required Color secondary,
    required BorderRadius borderRadius,
    required BorderRadius borderRadiusSmall,
    required BorderRadius borderRadiusLarge,
    String package = 'impaktfull_ui_2',
  }) =>
      DefaultTheme.withMinimalChanges(
        accent: accent,
        secondary: secondary,
        borderRadius: borderRadius,
        borderRadiusSmall: borderRadiusSmall,
        borderRadiusLarge: borderRadiusLarge,
      );

  static ImpaktfullUiTheme getDefault() => DefaultTheme.withMinimalChanges(
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        borderRadiusSmall: BorderRadius.circular(6),
        borderRadius: BorderRadius.circular(8),
        borderRadiusLarge: BorderRadius.circular(12),
      );

  static ImpaktfullUiTheme of(BuildContext context) => theme;

  ImpaktfullUiTheme copyWith({
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    ImpaktfullUiComponentsTheme? components,
  }) =>
      ImpaktfullUiTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        textStyles: textStyles ?? this.textStyles,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? this.shadows,
        components: components ?? this.components,
      );
}
