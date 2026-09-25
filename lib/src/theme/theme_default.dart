import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiDefaultTheme {
  /// A full [ImpaktfullUiTheme] built from a handful of base tokens: every
  /// color, border radius and font that is not given falls back to the
  /// default for [brightness].
  ///
  /// The dark defaults are the light defaults with the neutral tokens moved to
  /// the other end of the same grey scale. Everything with a meaning of its
  /// own (the given [primary], [accent] and [secondary], and the semantic
  /// [warning], [error], [info], [success] and [destructive] colors) stays the
  /// same, so a brand keeps its identity in both variants:
  ///
  /// | token         | light      | dark       |
  /// |---------------|------------|------------|
  /// | canvas        | 0xFFF9FAFB | 0xFF0C0E12 |
  /// | card          | 0xFFFFFFFF | 0xFF16181D |
  /// | card2         | grey 20%   | white 20%  |
  /// | border        | grey 20%   | white 20%  |
  /// | shadow        | black 12%  | black 45%  |
  /// | text          | 0xFF344054 | 0xFFECEFF3 |
  /// | tertiary      | 0xFF475467 | 0xFFB4BCC8 |
  /// | textTertiary  | 0xFF999b9e | 0xFF9DA4AE |
  ///
  /// Every one of them stays overridable: pass the token to keep full control
  /// over it in both variants.
  ///
  /// [fontFamilyDisplay] and [fontFamilyText] default to the Ubuntu and
  /// Geologica families of the impaktfull branding. The package does not ship
  /// those fonts: an app that wants them declares them in its own
  /// `pubspec.yaml` (see the example app). Pass your own families, or `null`
  /// for the font of the platform.
  ///
  /// ## The typography of a design system
  ///
  /// [heightDisplay] / [heightText] (the line height, as a multiple of the
  /// font size), [letterSpacingDisplay] / [letterSpacingText] and
  /// [fontWeightDisplay] / [fontWeightText] apply to every style of the
  /// display and of the text scale, so a line height of `1.5714` is one value
  /// instead of 13 groups of styles. `null` (the default) leaves them to
  /// Flutter, which is what this package looked like before they existed.
  ///
  /// ## The border radius and spacing scale
  ///
  /// [radius] is the seed of the border radius scale: the radius of a control
  /// (a button, an input field, a badge, a table, ...), which almost every
  /// radius of the package reads. The rest of the scale follows it (see
  /// [ImpaktfullUiDimensTheme.getDefault]), so `radius: 6` is Ant Design's
  /// scale and `radius: 10` is shadcn/ui's, in one value. A step that is
  /// passed ([borderRadius], [borderRadiusLarge], ...) wins over the seed.
  /// [spacingUnit] does the same for [ImpaktfullUiSpacingTheme].
  ///
  /// ## Passing a base token group
  ///
  /// [colors], [textStyles], [dimens], [durations], [shadows] and [assets]
  /// each replace the group this function would build, and the component
  /// themes are built from the result. A group that is passed wins over the
  /// individual tokens of that group: with [colors], the [primary] / [accent]
  /// / [secondary] / ... parameters are ignored (and [primary], [accent] and
  /// [secondary] may be left out), and with [dimens] so are [radius] and the
  /// [borderRadius] steps. A group that is *not* passed is still derived from
  /// the ones that are: without [textStyles] the text styles take their colors
  /// from the given [colors], and without [shadows] the shadow scale is
  /// derived from `colors.shadow`.
  ///
  /// This is the way to reach a token that has no parameter of its own (the
  /// animation durations, the shadow scale) and still have every component
  /// theme built from it:
  ///
  /// ```dart
  /// final theme = ImpaktfullUiDefaultTheme.withMinimalChanges(
  ///   primary: const Color(0xFF1677FF),
  ///   accent: const Color(0xFF1677FF),
  ///   secondary: const Color(0xFF1677FF),
  ///   radius: 6,
  ///   heightText: 1.5714,
  ///   durations: const ImpaktfullUiDurationTheme(
  ///     short: Duration(milliseconds: 100),
  ///     medium: Duration(milliseconds: 200),
  ///     long: Duration(milliseconds: 300),
  ///   ),
  /// );
  /// ```
  static ImpaktfullUiTheme<T> withMinimalChanges<T extends Object>({
    // `primary`, `accent` and `secondary` are only optional so a theme can be
    // built from a `colors` group instead; the assert below keeps them
    // required without one. They become `required` again in 1.0.0.
    Color? primary,
    Color? accent,
    Color? secondary,
    Brightness brightness = Brightness.light,
    String? label,
    Color? tertiary,
    Color? canvas,
    Color? card,
    Color? card2,
    Color? border,
    Color? shadow,
    Color? text,
    Color? textSecondary,
    Color? textTertiary,
    Color? textOnPrimary,
    Color? textOnAccent,
    Color? textOnSecondary,
    Color? textOnDestructive,
    Color? warning,
    Color? error,
    Color? success,
    Color? info,
    Color? destructive,
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
    double? fontSizeText,
    String? package,
    String? assetSuffix,
    ImpaktfullUiAssetTheme? assets,
    ImpaktfullUiColorTheme? colors,
    ImpaktfullUiTextStylesTheme? textStyles,
    ImpaktfullUiDimensTheme? dimens,
    ImpaktfullUiDurationTheme? durations,
    ImpaktfullUiShadowsTheme? shadows,
    T? customTheme,
  }) {
    assert(
      colors != null ||
          (primary != null && accent != null && secondary != null),
      'primary, accent and secondary are required, unless a full `colors` '
      'group is passed instead.',
    );
    final isDark = brightness == Brightness.dark;
    final neutral = isDark ? Colors.white : Colors.grey;
    final resolvedColors = colors ??
        ImpaktfullUiColorTheme(
          primary: primary!,
          accent: accent!,
          secondary: secondary!,
          tertiary: tertiary ??
              (isDark ? const Color(0xFFB4BCC8) : const Color(0xFF475467)),
          canvas: canvas ??
              (isDark ? const Color(0xFF0C0E12) : const Color(0xFFF9FAFB)),
          card: card ??
              (isDark ? const Color(0xFF16181D) : const Color(0xFFFFFFFF)),
          border: border ?? neutral.withOpacityPercentage(0.2),
          card2: card2 ?? neutral.withOpacityPercentage(0.2),
          shadow: shadow ?? (isDark ? Colors.black45 : Colors.black12),
          text: text ??
              (isDark ? const Color(0xFFECEFF3) : const Color(0xFF344054)),
          textSecondary: textSecondary ?? secondary,
          textTertiary: textTertiary ??
              tertiary ??
              (isDark ? const Color(0xFF9DA4AE) : const Color(0xFF999b9e)),
          textOnPrimary: textOnPrimary ?? const Color(0xFFFFFFFF),
          textOnAccent: textOnAccent ?? const Color(0xFFFFFFFF),
          textOnSecondary: textOnSecondary ?? const Color(0xFFFFFFFF),
          textOnDestructive: textOnDestructive ?? const Color(0xFFFFFFFF),
          warning: warning ?? const Color(0xFFFFA733),
          error: error ?? const Color(0xFFEB2F21),
          info: info ?? const Color(0xFF1C90D4),
          success: success ?? const Color(0xFF34B81F),
          destructive: destructive ?? const Color(0xFFBD0D00),
        );
    final resolvedDimens = dimens ??
        ImpaktfullUiDimensTheme.getDefault(
          radius: radius,
          borderRadiusExtraSmall: borderRadiusExtraSmall,
          borderRadiusSmall: borderRadiusSmall,
          borderRadius: borderRadius,
          borderRadiusLarge: borderRadiusLarge,
          borderRadiusExtraLarge: borderRadiusExtraLarge,
          borderRadiusCircle: borderRadiusCircle,
          spacingUnit: spacingUnit,
        );
    final resolvedTextStyles = textStyles ??
        ImpaktfullUiTextStylesTheme.getDefault(
          colors: resolvedColors,
          fontFamilyDisplay: fontFamilyDisplay,
          fontFamilyText: fontFamilyText,
          heightDisplay: heightDisplay,
          heightText: heightText,
          letterSpacingDisplay: letterSpacingDisplay,
          letterSpacingText: letterSpacingText,
          fontWeightDisplay: fontWeightDisplay,
          fontWeightText: fontWeightText,
          fontSizeText: fontSizeText,
        );
    final resolvedShadows = shadows ??
        ImpaktfullUiShadowsTheme.getDefault(
          shadowBase: resolvedColors.shadow,
        );
    final resolvedAssets = assets ??
        ImpaktfullUiAssetTheme.getDefault(
          package: package,
          assetSuffix: assetSuffix,
        );
    final resolvedDurations =
        durations ?? ImpaktfullUiDurationTheme.getDefault();
    return ImpaktfullUiTheme(
      label: label,
      brightness: brightness,
      customTheme: customTheme,
      assets: resolvedAssets,
      colors: resolvedColors,
      textStyles: resolvedTextStyles,
      dimens: resolvedDimens,
      durations: resolvedDurations,
      shadows: resolvedShadows,
      components: ImpaktfullUiComponentsTheme.getDefault(
        assets: resolvedAssets,
        colors: resolvedColors,
        textStyles: resolvedTextStyles,
        dimens: resolvedDimens,
        durations: resolvedDurations,
        shadows: resolvedShadows,
      ),
    );
  }
}
