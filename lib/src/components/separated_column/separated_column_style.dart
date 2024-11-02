import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSeparatedColumnTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSeparatedColumnAssetsTheme assets;
  final ImpaktfullUiSeparatedColumnColorTheme colors;
  final ImpaktfullUiSeparatedColumnDimensTheme dimens;
  final ImpaktfullUiSeparatedColumnTextStyleTheme textStyles;

  const ImpaktfullUiSeparatedColumnTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSeparatedColumnTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.separatedColumn;
}

class ImpaktfullUiSeparatedColumnAssetsTheme {
  const ImpaktfullUiSeparatedColumnAssetsTheme();
}

class ImpaktfullUiSeparatedColumnColorTheme {
  final Color background;
  final Color? border;
  const ImpaktfullUiSeparatedColumnColorTheme({
    required this.background,
    required this.border,
  });
}

class ImpaktfullUiSeparatedColumnDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry titleMargin;
  final EdgeInsetsGeometry separatorMargin;
  const ImpaktfullUiSeparatedColumnDimensTheme({
    required this.borderRadius,
    required this.titleMargin,
    required this.separatorMargin,
  });
}

class ImpaktfullUiSeparatedColumnTextStyleTheme {
  const ImpaktfullUiSeparatedColumnTextStyleTheme();
}
