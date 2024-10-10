import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSectionTitleTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSectionTitleAssetsTheme assets;
  final ImpaktfullUiSectionTitleColorTheme colors;
  final ImpaktfullUiSectionTitleDimensTheme dimens;
  final ImpaktfullUiSectionTitleTextStyleTheme textStyles;

  const ImpaktfullUiSectionTitleTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSectionTitleTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sectionTitle;
}

class ImpaktfullUiSectionTitleAssetsTheme {
  const ImpaktfullUiSectionTitleAssetsTheme();
}

class ImpaktfullUiSectionTitleColorTheme {
  final Color icons;
  const ImpaktfullUiSectionTitleColorTheme({
    required this.icons,
  });
}

class ImpaktfullUiSectionTitleDimensTheme {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry marginWithIconButtonActions;
  const ImpaktfullUiSectionTitleDimensTheme({
    required this.margin,
    required this.marginWithIconButtonActions,
  });
}

class ImpaktfullUiSectionTitleTextStyleTheme {
  final TextStyle title;
  const ImpaktfullUiSectionTitleTextStyleTheme({
    required this.title,
  });
}
