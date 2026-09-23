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
import 'package:impaktfull_ui/src/theme/theme_mode.dart';

export 'asset_theme.dart';
export 'color_theme.dart';
export 'component_theme.dart';
export 'dimens_theme.dart';
export 'duration_theme.dart';
export 'shadow_theme.dart';
export 'textstyle_theme.dart';
export 'theme_configurator.dart';
export 'theme_default.dart';
export 'theme_mode.dart';

class ImpaktfullUiTheme<T extends Object> {
  static const _packageName = 'impaktfull_ui';

  final String? label;

  /// Whether this theme is meant for a light or a dark background.
  ///
  /// `ImpaktfullUiApp` picks between its `impaktfullUiTheme` and its
  /// `impaktfullUiDarkTheme` with [ImpaktfullUiThemeMode], it does not read
  /// this value. It is here so a component (or an app) can tell which variant
  /// it is rendering on, e.g. to pick an asset.
  final Brightness brightness;
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
    this.brightness = Brightness.light,
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
    String? fontFamilyDisplay = 'Ubuntu',
    String? fontFamilyText = 'Geologica',
    String? package = _packageName,
    String? assetSuffix,
    Brightness brightness = Brightness.light,
    T? customTheme,
  }) =>
      ImpaktfullUiDefaultTheme.withMinimalChanges<T>(
        label: label,
        brightness: brightness,
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

  /// The impaktfull branding on a light background.
  ///
  /// [fontFamilyDisplay] and [fontFamilyText] default to the Ubuntu and
  /// Geologica of the impaktfull branding. The package does not ship those
  /// fonts: an app that wants them declares them in its own `pubspec.yaml`
  /// (see the example app). Pass your own families, or `null` for the font of
  /// the platform.
  static ImpaktfullUiTheme<T> getDefault<T extends Object>({
    String? package = _packageName,
    String? assetSuffix,
    String? fontFamilyDisplay = 'Ubuntu',
    String? fontFamilyText = 'Geologica',
    T? customTheme,
  }) =>
      ImpaktfullUiDefaultTheme.withMinimalChanges<T>(
        label: 'impaktfull Theme',
        primary: const Color(0xFF1A1A1A),
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        package: package,
        assetSuffix: assetSuffix,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
        customTheme: customTheme,
      );

  /// The impaktfull branding on a dark background: [getDefault] with the dark
  /// defaults of [ImpaktfullUiDefaultTheme.withMinimalChanges].
  ///
  /// The accent stays the same, the neutral tokens (canvas, card, border,
  /// text) move to the other end of the grey scale. `primary` of the light
  /// theme is a near-black neutral instead of a brand color, so the dark
  /// theme flips it to a near-white one (with near-black text on it).
  ///
  /// Pass it to `ImpaktfullUiApp(impaktfullUiDarkTheme:)` to follow the
  /// brightness of the platform:
  ///
  /// ```dart
  /// ImpaktfullUiApp(
  ///   title: 'My App',
  ///   impaktfullUiTheme: ImpaktfullUiTheme.getDefault(),
  ///   impaktfullUiDarkTheme: ImpaktfullUiTheme.getDefaultDark(),
  ///   home: const MyHomeScreen(),
  /// );
  /// ```
  static ImpaktfullUiTheme<T> getDefaultDark<T extends Object>({
    String? package = _packageName,
    String? assetSuffix,
    String? fontFamilyDisplay = 'Ubuntu',
    String? fontFamilyText = 'Geologica',
    T? customTheme,
  }) =>
      ImpaktfullUiDefaultTheme.withMinimalChanges<T>(
        label: 'impaktfull Dark Theme',
        brightness: Brightness.dark,
        primary: const Color(0xFFF5F5F5),
        textOnPrimary: const Color(0xFF1A1A1A),
        accent: const Color(0xFF7d64f2),
        secondary: const Color(0xFF7d64f2),
        package: package,
        assetSuffix: assetSuffix,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
        customTheme: customTheme,
      );

  static ImpaktfullUiTheme<T>? maybeOf<T extends Object>(BuildContext context) {
    final theme = ImpaktfullUiThemeConfigurator.maybeOf(context);
    if (theme == null) return null;
    return theme.theme as ImpaktfullUiTheme<T>;
  }

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
    Brightness? brightness,
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
        brightness: brightness ?? this.brightness,
        colors: colors ?? this.colors,
        textStyles: textStyles ?? this.textStyles,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        shadows: shadows ?? this.shadows,
        components: components ?? this.components,
        customTheme: customTheme ?? customThemeOrNull,
      );
}
