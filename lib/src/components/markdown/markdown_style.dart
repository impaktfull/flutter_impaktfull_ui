import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

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

  ImpaktfullUiMarkdownTheme copyWith({
    ImpaktfullUiMarkdownAssetsTheme? assets,
    ImpaktfullUiMarkdownColorTheme? colors,
    ImpaktfullUiMarkdownDimensTheme? dimens,
    ImpaktfullUiMarkdownTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiMarkdownTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMarkdownTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiMarkdownAssetsTheme {
  final ImpaktfullUiAsset unorderedListBullet;
  const ImpaktfullUiMarkdownAssetsTheme({
    required this.unorderedListBullet,
  });

  ImpaktfullUiMarkdownAssetsTheme copyWith({
    ImpaktfullUiAsset? unorderedListBullet,
  }) =>
      ImpaktfullUiMarkdownAssetsTheme(
        unorderedListBullet: unorderedListBullet ?? this.unorderedListBullet,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMarkdownAssetsTheme &&
          unorderedListBullet == other.unorderedListBullet;

  @override
  int get hashCode => unorderedListBullet.hashCode;
}

class ImpaktfullUiMarkdownColorTheme {
  final Color code;
  final Color error;
  const ImpaktfullUiMarkdownColorTheme({
    required this.code,
    required this.error,
  });

  ImpaktfullUiMarkdownColorTheme copyWith({
    Color? code,
    Color? error,
  }) =>
      ImpaktfullUiMarkdownColorTheme(
        code: code ?? this.code,
        error: error ?? this.error,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMarkdownColorTheme &&
          code == other.code &&
          error == other.error;

  @override
  int get hashCode => Object.hash(code, error);
}

class ImpaktfullUiMarkdownDimensTheme {
  final BorderRadiusGeometry code;

  /// The padding around a block of code.
  final EdgeInsetsGeometry codePadding;

  const ImpaktfullUiMarkdownDimensTheme({
    required this.code,
    this.codePadding = const EdgeInsets.all(8),
  });

  ImpaktfullUiMarkdownDimensTheme copyWith({
    BorderRadiusGeometry? code,
    EdgeInsetsGeometry? codePadding,
  }) =>
      ImpaktfullUiMarkdownDimensTheme(
        code: code ?? this.code,
        codePadding: codePadding ?? this.codePadding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMarkdownDimensTheme &&
          code == other.code &&
          codePadding == other.codePadding;

  @override
  int get hashCode => Object.hash(code, codePadding);
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

  ImpaktfullUiMarkdownTextStyleTheme copyWith({
    TextStyle? alt,
    TextStyle? code,
    TextStyle? error,
    TextStyle? h1,
    TextStyle? h2,
    TextStyle? h3,
    TextStyle? h4,
    TextStyle? h5,
    TextStyle? h6,
    TextStyle? link,
    TextStyle? orderedList,
    TextStyle? paragraph,
    TextStyle? unorderedList,
  }) =>
      ImpaktfullUiMarkdownTextStyleTheme(
        alt: alt ?? this.alt,
        code: code ?? this.code,
        error: error ?? this.error,
        h1: h1 ?? this.h1,
        h2: h2 ?? this.h2,
        h3: h3 ?? this.h3,
        h4: h4 ?? this.h4,
        h5: h5 ?? this.h5,
        h6: h6 ?? this.h6,
        link: link ?? this.link,
        orderedList: orderedList ?? this.orderedList,
        paragraph: paragraph ?? this.paragraph,
        unorderedList: unorderedList ?? this.unorderedList,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiMarkdownTextStyleTheme &&
          h1 == other.h1 &&
          h2 == other.h2 &&
          h3 == other.h3 &&
          h4 == other.h4 &&
          h5 == other.h5 &&
          h6 == other.h6 &&
          paragraph == other.paragraph &&
          link == other.link &&
          orderedList == other.orderedList &&
          unorderedList == other.unorderedList &&
          code == other.code &&
          alt == other.alt &&
          error == other.error;

  @override
  int get hashCode => Object.hash(h1, h2, h3, h4, h5, h6, paragraph, link,
      orderedList, unorderedList, code, alt, error);
}
