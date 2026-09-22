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
}

class ImpaktfullUiTooltipTextStyleTheme {
  const ImpaktfullUiTooltipTextStyleTheme();

  ImpaktfullUiTooltipTextStyleTheme copyWith() =>
      const ImpaktfullUiTooltipTextStyleTheme();
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
}

class ImpaktfullUiTooltipAssetsTheme {
  const ImpaktfullUiTooltipAssetsTheme();

  ImpaktfullUiTooltipAssetsTheme copyWith() =>
      const ImpaktfullUiTooltipAssetsTheme();
}
