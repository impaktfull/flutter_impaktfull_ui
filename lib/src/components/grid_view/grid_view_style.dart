import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiGridViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiGridViewAssetsTheme assets;
  final ImpaktfullUiGridViewColorTheme colors;
  final ImpaktfullUiGridViewDimensTheme dimens;
  final ImpaktfullUiGridViewTextStyleTheme textStyles;

  const ImpaktfullUiGridViewTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiGridViewTheme copyWith({
    ImpaktfullUiGridViewAssetsTheme? assets,
    ImpaktfullUiGridViewColorTheme? colors,
    ImpaktfullUiGridViewDimensTheme? dimens,
    ImpaktfullUiGridViewTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiGridViewTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiGridViewTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.gridView;

  static ImpaktfullUiGridViewTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiGridViewTheme(
        assets: const ImpaktfullUiGridViewAssetsTheme(),
        colors: const ImpaktfullUiGridViewColorTheme(),
        dimens: const ImpaktfullUiGridViewDimensTheme(),
        textStyles: ImpaktfullUiGridViewTextStyleTheme(
          title: textStyles.onCanvas.display.small,
        ),
      );
}

class ImpaktfullUiGridViewAssetsTheme {
  const ImpaktfullUiGridViewAssetsTheme();

  ImpaktfullUiGridViewAssetsTheme copyWith() =>
      const ImpaktfullUiGridViewAssetsTheme();
}

class ImpaktfullUiGridViewColorTheme {
  const ImpaktfullUiGridViewColorTheme();

  ImpaktfullUiGridViewColorTheme copyWith() =>
      const ImpaktfullUiGridViewColorTheme();
}

class ImpaktfullUiGridViewDimensTheme {
  const ImpaktfullUiGridViewDimensTheme();

  ImpaktfullUiGridViewDimensTheme copyWith() =>
      const ImpaktfullUiGridViewDimensTheme();
}

class ImpaktfullUiGridViewTextStyleTheme {
  final TextStyle title;
  const ImpaktfullUiGridViewTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiGridViewTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiGridViewTextStyleTheme(
        title: title ?? this.title,
      );
}
