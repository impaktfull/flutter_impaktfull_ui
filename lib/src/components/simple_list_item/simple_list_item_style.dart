import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSimpleListItemTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSimpleListItemAssetsTheme assets;
  final ImpaktfullUiSimpleListItemColorTheme colors;
  final ImpaktfullUiSimpleListItemDimensTheme dimens;
  final ImpaktfullUiSimpleListItemTextStyleTheme textStyles;

  const ImpaktfullUiSimpleListItemTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSimpleListItemTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.simpleListItem;
}

class ImpaktfullUiSimpleListItemAssetsTheme {
  const ImpaktfullUiSimpleListItemAssetsTheme();
}

class ImpaktfullUiSimpleListItemColorTheme {
  final Color background;

  const ImpaktfullUiSimpleListItemColorTheme({
    required this.background,
  });
}

class ImpaktfullUiSimpleListItemDimensTheme {
  final EdgeInsets padding;
  final CrossAxisAlignment crossAxisAlignment;

  const ImpaktfullUiSimpleListItemDimensTheme({
    required this.padding,
    required this.crossAxisAlignment,
  });
}

class ImpaktfullUiSimpleListItemTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;

  const ImpaktfullUiSimpleListItemTextStyleTheme({
    required this.title,
    required this.subtitle,
  });
}
