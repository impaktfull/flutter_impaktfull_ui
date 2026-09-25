import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiTooltipTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiTooltipColorTheme colors;
  final ImpaktfullUiTooltipTextStyleTheme textStyles;
  final ImpaktfullUiTooltipDimensTheme dimens;
  final ImpaktfullUiTooltipDurationsTheme durations;
  final ImpaktfullUiTooltipAssetsTheme assets;

  const ImpaktfullUiTooltipTheme({
    required this.colors,
    required this.textStyles,
    required this.dimens,
    required this.durations,
    required this.assets,
  });

  ImpaktfullUiTooltipTheme copyWith({
    ImpaktfullUiTooltipAssetsTheme? assets,
    ImpaktfullUiTooltipColorTheme? colors,
    ImpaktfullUiTooltipDimensTheme? dimens,
    ImpaktfullUiTooltipDurationsTheme? durations,
    ImpaktfullUiTooltipTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiTooltipTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiTooltipTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.tooltip;

  static ImpaktfullUiTooltipTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiTooltipTheme(
        colors: ImpaktfullUiTooltipColorTheme(
          background: colors.primary,
        ),
        textStyles: const ImpaktfullUiTooltipTextStyleTheme(),
        dimens: ImpaktfullUiTooltipDimensTheme(
          borderRadius: dimens.borderRadiusSmall,
        ),
        durations: ImpaktfullUiTooltipDurationsTheme(
          wait: durations.long,
        ),
        assets: const ImpaktfullUiTooltipAssetsTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipTheme &&
          colors == other.colors &&
          textStyles == other.textStyles &&
          dimens == other.dimens &&
          durations == other.durations &&
          assets == other.assets;

  @override
  int get hashCode =>
      Object.hash(colors, textStyles, dimens, durations, assets);
}

class ImpaktfullUiTooltipColorTheme {
  final Color background;

  const ImpaktfullUiTooltipColorTheme({
    required this.background,
  });

  ImpaktfullUiTooltipColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiTooltipColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipColorTheme && background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiTooltipTextStyleTheme {
  /// The text in the tooltip.
  ///
  /// `null` (the default) leaves it to Flutter, which is what the tooltip
  /// rendered before this token existed. shadcn/ui uses `text-xs` in
  /// `text-primary-foreground`, Ant Design 14 in white.
  final TextStyle? text;

  const ImpaktfullUiTooltipTextStyleTheme({
    this.text,
  });

  ImpaktfullUiTooltipTextStyleTheme copyWith({
    TextStyle? text,
  }) =>
      ImpaktfullUiTooltipTextStyleTheme(
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipTextStyleTheme && text == other.text;

  @override
  int get hashCode => text.hashCode;
}

class ImpaktfullUiTooltipDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding between the border of the tooltip and its text.
  ///
  /// `null` (the default) leaves it to Flutter. shadcn/ui uses `px-3 py-1.5`,
  /// Ant Design `6px 8px`.
  final EdgeInsetsGeometry? padding;

  /// The space between the tooltip and the widget it belongs to.
  ///
  /// `null` (the default) leaves it to Flutter.
  final EdgeInsetsGeometry? margin;

  const ImpaktfullUiTooltipDimensTheme({
    required this.borderRadius,
    this.padding,
    this.margin,
  });

  ImpaktfullUiTooltipDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
  }) =>
      ImpaktfullUiTooltipDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipDimensTheme &&
          borderRadius == other.borderRadius &&
          margin == other.margin &&
          padding == other.padding;

  @override
  int get hashCode => Object.hash(borderRadius, margin, padding);
}

class ImpaktfullUiTooltipDurationsTheme {
  final Duration wait;

  const ImpaktfullUiTooltipDurationsTheme({
    required this.wait,
  });

  ImpaktfullUiTooltipDurationsTheme copyWith({
    Duration? wait,
  }) =>
      ImpaktfullUiTooltipDurationsTheme(
        wait: wait ?? this.wait,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipDurationsTheme && wait == other.wait;

  @override
  int get hashCode => wait.hashCode;
}

class ImpaktfullUiTooltipAssetsTheme {
  const ImpaktfullUiTooltipAssetsTheme();

  ImpaktfullUiTooltipAssetsTheme copyWith() =>
      const ImpaktfullUiTooltipAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTooltipAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
