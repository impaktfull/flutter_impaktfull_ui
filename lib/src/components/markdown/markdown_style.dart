import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

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
