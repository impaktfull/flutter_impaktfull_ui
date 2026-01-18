import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

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
          previewText: textStyles.onCard.text.small.light,
        ),
      );
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
}

class ImpaktfullUiWysiwygColorTheme {
  const ImpaktfullUiWysiwygColorTheme();
}

class ImpaktfullUiWysiwygDimensTheme {
  const ImpaktfullUiWysiwygDimensTheme();
}

class ImpaktfullUiWysiwygTextStyleTheme {
  final TextStyle previewText;
  const ImpaktfullUiWysiwygTextStyleTheme({
    required this.previewText,
  });
}
