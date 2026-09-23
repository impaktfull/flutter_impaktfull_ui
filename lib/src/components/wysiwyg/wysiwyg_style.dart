import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiWysiwygTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiWysiwygAssetsTheme assets;
  final ImpaktfullUiWysiwygColorTheme colors;
  final ImpaktfullUiWysiwygDimensTheme dimens;
  final ImpaktfullUiWysiwygTextStyleTheme textStyles;

  const ImpaktfullUiWysiwygTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiWysiwygTheme copyWith({
    ImpaktfullUiWysiwygAssetsTheme? assets,
    ImpaktfullUiWysiwygColorTheme? colors,
    ImpaktfullUiWysiwygDimensTheme? dimens,
    ImpaktfullUiWysiwygTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiWysiwygTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiWysiwygTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.wysiwyg;

  static ImpaktfullUiWysiwygTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiWysiwygTheme(
        assets: ImpaktfullUiWysiwygAssetsTheme(
          bold: assets.icons.wysiwygBold,
          code: assets.icons.wysiwygCode,
          codeBlock: assets.icons.wysiwygCodeBlock,
          header: assets.icons.wysiwygHeader,
          italic: assets.icons.wysiwygItalic,
          orderedList: assets.icons.wysiwygOrderedList,
          unorderedList: assets.icons.wysiwygUnorderedList,
          link: assets.icons.wysiwygLink,
          photo: assets.icons.wysiwygPhoto,
        ),
        colors: const ImpaktfullUiWysiwygColorTheme(),
        dimens: const ImpaktfullUiWysiwygDimensTheme(),
        textStyles: ImpaktfullUiWysiwygTextStyleTheme(
          previewText: textStyles.onCanvas.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiWysiwygTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiWysiwygAssetsTheme {
  final ImpaktfullUiAsset bold;
  final ImpaktfullUiAsset code;
  final ImpaktfullUiAsset codeBlock;
  final ImpaktfullUiAsset header;
  final ImpaktfullUiAsset italic;
  final ImpaktfullUiAsset orderedList;
  final ImpaktfullUiAsset unorderedList;
  final ImpaktfullUiAsset link;
  final ImpaktfullUiAsset photo;
  const ImpaktfullUiWysiwygAssetsTheme({
    required this.bold,
    required this.code,
    required this.codeBlock,
    required this.header,
    required this.italic,
    required this.orderedList,
    required this.unorderedList,
    required this.link,
    required this.photo,
  });

  ImpaktfullUiWysiwygAssetsTheme copyWith({
    ImpaktfullUiAsset? bold,
    ImpaktfullUiAsset? code,
    ImpaktfullUiAsset? codeBlock,
    ImpaktfullUiAsset? header,
    ImpaktfullUiAsset? italic,
    ImpaktfullUiAsset? link,
    ImpaktfullUiAsset? orderedList,
    ImpaktfullUiAsset? photo,
    ImpaktfullUiAsset? unorderedList,
  }) =>
      ImpaktfullUiWysiwygAssetsTheme(
        bold: bold ?? this.bold,
        code: code ?? this.code,
        codeBlock: codeBlock ?? this.codeBlock,
        header: header ?? this.header,
        italic: italic ?? this.italic,
        link: link ?? this.link,
        orderedList: orderedList ?? this.orderedList,
        photo: photo ?? this.photo,
        unorderedList: unorderedList ?? this.unorderedList,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiWysiwygAssetsTheme &&
          bold == other.bold &&
          code == other.code &&
          codeBlock == other.codeBlock &&
          header == other.header &&
          italic == other.italic &&
          orderedList == other.orderedList &&
          unorderedList == other.unorderedList &&
          link == other.link &&
          photo == other.photo;

  @override
  int get hashCode => Object.hash(bold, code, codeBlock, header, italic,
      orderedList, unorderedList, link, photo);
}

class ImpaktfullUiWysiwygColorTheme {
  const ImpaktfullUiWysiwygColorTheme();

  ImpaktfullUiWysiwygColorTheme copyWith() =>
      const ImpaktfullUiWysiwygColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiWysiwygColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiWysiwygDimensTheme {
  const ImpaktfullUiWysiwygDimensTheme();

  ImpaktfullUiWysiwygDimensTheme copyWith() =>
      const ImpaktfullUiWysiwygDimensTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiWysiwygDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiWysiwygTextStyleTheme {
  final TextStyle previewText;
  const ImpaktfullUiWysiwygTextStyleTheme({
    required this.previewText,
  });

  ImpaktfullUiWysiwygTextStyleTheme copyWith({
    TextStyle? previewText,
  }) =>
      ImpaktfullUiWysiwygTextStyleTheme(
        previewText: previewText ?? this.previewText,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiWysiwygTextStyleTheme &&
          previewText == other.previewText;

  @override
  int get hashCode => previewText.hashCode;
}
