import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiFloatingActionButtonTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiFloatingActionButtonAssetsTheme assets;
  final ImpaktfullUiFloatingActionButtonColorTheme colors;
  final ImpaktfullUiFloatingActionButtonDimensTheme dimens;
  final ImpaktfullUiFloatingActionButtonTextStyleTheme textStyles;

  const ImpaktfullUiFloatingActionButtonTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiFloatingActionButtonTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.floatingActionButton;
}

class ImpaktfullUiFloatingActionButtonAssetsTheme {
  const ImpaktfullUiFloatingActionButtonAssetsTheme();
}

class ImpaktfullUiFloatingActionButtonColorTheme {
  final Color background;
  final Color backgroundDisabled;
  final Color icon;
  const ImpaktfullUiFloatingActionButtonColorTheme({
    required this.background,
    required this.backgroundDisabled,
    required this.icon,
  });
}

class ImpaktfullUiFloatingActionButtonDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiFloatingActionButtonDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiFloatingActionButtonTextStyleTheme {
  final TextStyle label;
  const ImpaktfullUiFloatingActionButtonTextStyleTheme({
    required this.label,
  });
}
