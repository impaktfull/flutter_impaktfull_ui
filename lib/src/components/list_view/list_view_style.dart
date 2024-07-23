import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiListViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiListViewTextStylesTheme textStyles;
  final ImpaktfullUiListViewDimensTheme dimens;

  const ImpaktfullUiListViewTheme({
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiListViewTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.listView;
}

class ImpaktfullUiListViewTextStylesTheme {
  final TextStyle title;

  const ImpaktfullUiListViewTextStylesTheme({
    required this.title,
  });
}

class ImpaktfullUiListViewDimensTheme {
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const ImpaktfullUiListViewDimensTheme({
    required this.borderRadius,
    required this.padding,
  });
}
