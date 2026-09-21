import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiProgressIndicatorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiProgressIndicatorAssetsTheme assets;
  final ImpaktfullUiProgressIndicatorColorTheme colors;
  final ImpaktfullUiProgressIndicatorDimensTheme dimens;
  final ImpaktfullUiProgressIndicatorDurationsTheme durations;
  final ImpaktfullUiProgressIndicatorTextStyleTheme textStyles;

  const ImpaktfullUiProgressIndicatorTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.durations,
    required this.textStyles,
  });

  ImpaktfullUiProgressIndicatorTheme copyWith({
    ImpaktfullUiProgressIndicatorAssetsTheme? assets,
    ImpaktfullUiProgressIndicatorColorTheme? colors,
    ImpaktfullUiProgressIndicatorDimensTheme? dimens,
    ImpaktfullUiProgressIndicatorDurationsTheme? durations,
    ImpaktfullUiProgressIndicatorTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiProgressIndicatorTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiProgressIndicatorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.progressIndicator;

  static ImpaktfullUiProgressIndicatorTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiProgressIndicatorTheme(
        assets: const ImpaktfullUiProgressIndicatorAssetsTheme(),
        colors: ImpaktfullUiProgressIndicatorColorTheme(
          background: colors.canvas,
          foreground: colors.accent,
          border: colors.border,
        ),
        dimens: ImpaktfullUiProgressIndicatorDimensTheme(
          width: 4,
          borderRadius: dimens.borderRadiusExtraSmall,
        ),
        durations: ImpaktfullUiProgressIndicatorDurationsTheme(
          progress: durations.short,
        ),
        textStyles: ImpaktfullUiProgressIndicatorTextStyleTheme(
          text: textStyles.onCard.text.small.medium,
        ),
      );
}

class ImpaktfullUiProgressIndicatorAssetsTheme {
  const ImpaktfullUiProgressIndicatorAssetsTheme();

  ImpaktfullUiProgressIndicatorAssetsTheme copyWith() =>
      const ImpaktfullUiProgressIndicatorAssetsTheme();
}

class ImpaktfullUiProgressIndicatorColorTheme {
  final Color background;
  final Color border;
  final Color foreground;
  const ImpaktfullUiProgressIndicatorColorTheme({
    required this.background,
    required this.foreground,
    required this.border,
  });

  ImpaktfullUiProgressIndicatorColorTheme copyWith({
    Color? background,
    Color? border,
    Color? foreground,
  }) =>
      ImpaktfullUiProgressIndicatorColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        foreground: foreground ?? this.foreground,
      );
}

class ImpaktfullUiProgressIndicatorDimensTheme {
  final double width;
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiProgressIndicatorDimensTheme({
    required this.width,
    required this.borderRadius,
  });

  ImpaktfullUiProgressIndicatorDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? width,
  }) =>
      ImpaktfullUiProgressIndicatorDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        width: width ?? this.width,
      );
}

class ImpaktfullUiProgressIndicatorDurationsTheme {
  final Duration progress;
  const ImpaktfullUiProgressIndicatorDurationsTheme({
    required this.progress,
  });

  ImpaktfullUiProgressIndicatorDurationsTheme copyWith({
    Duration? progress,
  }) =>
      ImpaktfullUiProgressIndicatorDurationsTheme(
        progress: progress ?? this.progress,
      );
}

class ImpaktfullUiProgressIndicatorTextStyleTheme {
  final TextStyle text;
  const ImpaktfullUiProgressIndicatorTextStyleTheme({
    required this.text,
  });

  ImpaktfullUiProgressIndicatorTextStyleTheme copyWith({
    TextStyle? text,
  }) =>
      ImpaktfullUiProgressIndicatorTextStyleTheme(
        text: text ?? this.text,
      );
}
