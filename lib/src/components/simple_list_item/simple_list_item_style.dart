import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry borderRadius;
  final CrossAxisAlignment crossAxisAlignment;

  const ImpaktfullUiSimpleListItemDimensTheme({
    required this.padding,
    required this.borderRadius,
    required this.crossAxisAlignment,
  });
}

class ImpaktfullUiSimpleListItemTextStyleTheme {
  final TextStyle title;
  final TextStyle titleDanger;
  final TextStyle subtitle;
  final TextStyle subtitleDanger;

  const ImpaktfullUiSimpleListItemTextStyleTheme({
    required this.title,
    required this.titleDanger,
    required this.subtitle,
    required this.subtitleDanger,
  });
}
