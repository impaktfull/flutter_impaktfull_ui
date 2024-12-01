import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/text_style_extension.dart';

class ImpaktfullUiMarkdownTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiMarkdownAssetsTheme assets;
  final ImpaktfullUiMarkdownColorTheme colors;
  final ImpaktfullUiMarkdownDimensTheme dimens;
  final ImpaktfullUiMarkdownTextStyleTheme textStyles;

  const ImpaktfullUiMarkdownTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiMarkdownTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.markdown;

  static ImpaktfullUiMarkdownTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiMarkdownTheme(
        assets: ImpaktfullUiMarkdownAssetsTheme(
          unorderedListBullet: assets.icons.wysiwygUnorderedListItem,
        ),
        colors: ImpaktfullUiMarkdownColorTheme(
          code: colors.card2,
          error: colors.error,
        ),
        dimens: ImpaktfullUiMarkdownDimensTheme(
          code: dimens.borderRadiusSmall,
        ),
        textStyles: ImpaktfullUiMarkdownTextStyleTheme(
          h1: textStyles.onCanvas.display.large.bold,
          h2: textStyles.onCanvas.display.medium.bold,
          h3: textStyles.onCanvas.display.small.bold,
          h4: textStyles.onCanvas.display.extraSmall.bold,
          h5: textStyles.onCanvas.display.extraSmall.medium,
          h6: textStyles.onCanvas.display.extraSmall,
          paragraph: textStyles.onCanvas.text.small,
          link: textStyles.onCardAccent.text.small.bold.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: colors.accent,
            decorationThickness: 2,
          ),
          orderedList: textStyles.onCanvas.text.small.medium,
          unorderedList: textStyles.onCanvas.text.small.medium,
          code: textStyles.onCanvas.text.small,
          alt: textStyles.onCanvas.text.small.medium,
          error:
              textStyles.onCanvas.text.extraSmall.copyWith(color: colors.error),
        ),
      );
}

class ImpaktfullUiMarkdownAssetsTheme {
  final ImpaktfullUiAsset unorderedListBullet;
  const ImpaktfullUiMarkdownAssetsTheme({
    required this.unorderedListBullet,
  });
}

class ImpaktfullUiMarkdownColorTheme {
  final Color code;
  final Color error;
  const ImpaktfullUiMarkdownColorTheme({
    required this.code,
    required this.error,
  });
}

class ImpaktfullUiMarkdownDimensTheme {
  final BorderRadiusGeometry code;
  const ImpaktfullUiMarkdownDimensTheme({
    required this.code,
  });
}

class ImpaktfullUiMarkdownTextStyleTheme {
  final TextStyle h1;
  final TextStyle h2;
  final TextStyle h3;
  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle paragraph;
  final TextStyle link;
  final TextStyle orderedList;
  final TextStyle unorderedList;
  final TextStyle code;
  final TextStyle alt;
  final TextStyle error;

  const ImpaktfullUiMarkdownTextStyleTheme({
    required this.h1,
    required this.h2,
    required this.h3,
    required this.h4,
    required this.h5,
    required this.h6,
    required this.paragraph,
    required this.link,
    required this.orderedList,
    required this.unorderedList,
    required this.code,
    required this.alt,
    required this.error,
  });
}
