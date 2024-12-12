import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiHorizontalTabTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabColorTheme colors;
  final ImpaktfullUiHorizontalTabTextStylesTheme textStyles;
  final ImpaktfullUiHorizontalTabDimensTheme dimens;

  const ImpaktfullUiHorizontalTabTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiHorizontalTabTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTab;
}

class ImpaktfullUiHorizontalTabColorTheme {
  final Color backgroundUnSelectedTab;
  final Color backgroundSelectedTab;

  const ImpaktfullUiHorizontalTabColorTheme({
    required this.backgroundUnSelectedTab,
    required this.backgroundSelectedTab,
  });
}

class ImpaktfullUiHorizontalTabTextStylesTheme {
  final TextStyle selected;
  final TextStyle unselected;

  const ImpaktfullUiHorizontalTabTextStylesTheme({
    required this.selected,
    required this.unselected,
  });
}

class ImpaktfullUiHorizontalTabDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiHorizontalTabDimensTheme({
    required this.borderRadius,
  });
}
