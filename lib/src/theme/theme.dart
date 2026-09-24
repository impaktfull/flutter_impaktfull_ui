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
export 'presets/ant_design_theme.dart';
export 'presets/shadcn_theme.dart';
export 'shadow_theme.dart';
export 'spacing_theme.dart';
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

  /// [ImpaktfullUiDefaultTheme.withMinimalChanges] with the assets of this
  /// package, which documents every parameter.
  ///
  /// [primary], [accent] and [secondary] are only optional so a theme can be
  /// built from a [colors] group instead; without one they are required (and
  /// `required` again in 1.0.0).
  static ImpaktfullUiTheme<T> custom<T extends Object>({
    String? label,
    Color? primary,
    Color? accent,
    Color? secondary,
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
    double radius = 8,
    BorderRadiusGeometry? borderRadiusExtraSmall,
    BorderRadiusGeometry? borderRadiusSmall,
    BorderRadiusGeometry? borderRadius,
    BorderRadiusGeometry? borderRadiusLarge,
    BorderRadiusGeometry? borderRadiusExtraLarge,
    BorderRadiusGeometry? borderRadiusCircle,
    double spacingUnit = 4,
    String? fontFamilyDisplay = 'Ubuntu',
    String? fontFamilyText = 'Geologica',
    double? heightDisplay,
    double? heightText,
    double? letterSpacingDisplay,
    double? letterSpacingText,
    FontWeight? fontWeightDisplay,
    FontWeight? fontWeightText,
    String? package = _packageName,
    String? assetSuffix,
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
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
        radius: radius,
        borderRadius: borderRadius,
        borderRadiusExtraSmall: borderRadiusExtraSmall,
        borderRadiusSmall: borderRadiusSmall,
        borderRadiusLarge: borderRadiusLarge,
        borderRadiusExtraLarge: borderRadiusExtraLarge,
        borderRadiusCircle: borderRadiusCircle,
        spacingUnit: spacingUnit,
        package: package,
        assetSuffix: assetSuffix,
        fontFamilyDisplay: fontFamilyDisplay,
        fontFamilyText: fontFamilyText,
        heightDisplay: heightDisplay,
        heightText: heightText,
        letterSpacingDisplay: letterSpacingDisplay,
        letterSpacingText: letterSpacingText,
        fontWeightDisplay: fontWeightDisplay,
        fontWeightText: fontWeightText,
        assets: assets,
        colors: colors,
        textStyles: textStyles,
        dimens: dimens,
        durations: durations,
        shadows: shadows,
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

  /// This theme with the given values replaced, and nothing else.
  ///
  /// It replaces exactly what it is given, so `copyWith(colors: ...)` changes
  /// `theme.colors` and leaves [components] alone: the 87 component themes
  /// were built from the old base tokens and keep them. That is on purpose —
  /// `copyWith` never throws away a per-component customisation that was
  /// layered on top.
  ///
  /// To change a base token *everywhere*, use [copyWithBaseTokens], which
  /// builds the component themes again from the new base tokens.
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

  /// This theme with the given base token groups replaced **and** every
  /// component theme built again from them.
  ///
  /// This is the difference with [copyWith]: `copyWith(colors: ...)` replaces
  /// `theme.colors` and leaves the 87 component themes as they were, so
  /// `theme.components.button.colors.primary` still holds the old accent.
  /// `copyWithBaseTokens(colors: ...)` rebuilds them with
  /// [ImpaktfullUiComponentsTheme.getDefault], so the new token reaches every
  /// component:
  ///
  /// ```dart
  /// final base = ImpaktfullUiTheme.getDefault();
  /// final theme = base.copyWithBaseTokens(
  ///   colors: base.colors.copyWith(accent: Colors.teal),
  ///   durations: const ImpaktfullUiDurationTheme(
  ///     short: Duration(milliseconds: 100),
  ///     medium: Duration(milliseconds: 200),
  ///     long: Duration(milliseconds: 300),
  ///   ),
  /// );
  /// ```
  ///
  /// Because the component themes are built from scratch, this **discards
  /// every change that was made to a component theme** of this theme. Apply
  /// those with [copyWith] afterwards:
  ///
  /// ```dart
  /// final theme = base
  ///     .copyWithBaseTokens(colors: colors)
  ///     .copyWith(components: ...); // the per-component tokens, on top
  /// ```
  ///
  /// [textStyles] is not derived from [colors] here (unlike in
  /// [ImpaktfullUiDefaultTheme.withMinimalChanges], which builds a theme from
  /// nothing): a theme that is copied already has its text styles, and their
  /// colors are not always the ones of [colors]. Pass both, or build the theme
  /// again with `withMinimalChanges` to have the text styles follow the
  /// colors.
  ImpaktfullUiTheme<T> copyWithBaseTokens({
    String? label,
    Brightness? brightness,
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    T? customTheme,
  }) {
    final newAssets = assets ?? this.assets;
    final newColors = colors ?? this.colors;
    final newTextStyles = textStyles ?? this.textStyles;
    final newDimens = dimens ?? this.dimens;
    final newDurations = durations ?? this.durations;
    final newShadows = shadows ?? this.shadows;
    return ImpaktfullUiTheme<T>(
      label: label ?? this.label,
      brightness: brightness ?? this.brightness,
      assets: newAssets,
      colors: newColors,
      textStyles: newTextStyles,
      dimens: newDimens,
      durations: newDurations,
      shadows: newShadows,
      components: ImpaktfullUiComponentsTheme.getDefault(
        assets: newAssets,
        colors: newColors,
        textStyles: newTextStyles,
        dimens: newDimens,
        durations: newDurations,
        shadows: newShadows,
      ),
      customTheme: customTheme ?? customThemeOrNull,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other.runtimeType == runtimeType &&
          other is ImpaktfullUiTheme<T> &&
          label == other.label &&
          brightness == other.brightness &&
          assets == other.assets &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          durations == other.durations &&
          shadows == other.shadows &&
          components == other.components &&
          _customTheme == other._customTheme;

  @override
  int get hashCode => Object.hash(label, brightness, assets, colors, textStyles,
      dimens, durations, shadows, components, _customTheme);
}
