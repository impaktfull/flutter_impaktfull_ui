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
  const ImpaktfullUiTooltipTextStyleTheme();

  ImpaktfullUiTooltipTextStyleTheme copyWith() =>
      const ImpaktfullUiTooltipTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiTooltipTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiTooltipDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiTooltipDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiTooltipDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiTooltipDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiTooltipDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
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
