import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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

  static ImpaktfullUiWysiwygTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.wysiwyg;
}

class ImpaktfullUiWysiwygAssetsTheme {
  final ImpaktfullUiAsset bold;
  final ImpaktfullUiAsset italic;
  final ImpaktfullUiAsset orderedList;
  final ImpaktfullUiAsset unorderedList;
  final ImpaktfullUiAsset link;
  final ImpaktfullUiAsset photo;
  const ImpaktfullUiWysiwygAssetsTheme({
    required this.bold,
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
