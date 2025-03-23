import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiPlaceholderTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiPlaceholderAssetsTheme assets;
  final ImpaktfullUiPlaceholderColorTheme colors;
  final ImpaktfullUiPlaceholderDimensTheme dimens;
  final ImpaktfullUiPlaceholderTextStyleTheme textStyles;

  const ImpaktfullUiPlaceholderTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiPlaceholderTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.placeholder;

  static ImpaktfullUiPlaceholderTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
  }) =>
      ImpaktfullUiPlaceholderTheme(
        assets: const ImpaktfullUiPlaceholderAssetsTheme(),
        colors: const ImpaktfullUiPlaceholderColorTheme(),
        dimens: const ImpaktfullUiPlaceholderDimensTheme(
          margin: EdgeInsets.zero,
          assetWidth: 150,
          assetHeight: 150,
        ),
        textStyles: ImpaktfullUiPlaceholderTextStyleTheme(
          title: textStyles.onCanvas.display.small.semiBold,
          subtitle: textStyles.onCanvas.text.small.light,
        ),
      );
}

class ImpaktfullUiPlaceholderAssetsTheme {
  final ImpaktfullUiAsset? asset;
  const ImpaktfullUiPlaceholderAssetsTheme({
    this.asset,
  });
}

class ImpaktfullUiPlaceholderColorTheme {
  const ImpaktfullUiPlaceholderColorTheme();
}

class ImpaktfullUiPlaceholderDimensTheme {
  final EdgeInsets margin;
  final double assetWidth;
  final double assetHeight;

  const ImpaktfullUiPlaceholderDimensTheme({
    required this.margin,
    required this.assetWidth,
    required this.assetHeight,
  });
}

class ImpaktfullUiPlaceholderTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiPlaceholderTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}
