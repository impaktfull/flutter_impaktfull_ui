import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiUnifiedScreenLayoutTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiUnifiedScreenLayoutAssetsTheme assets;
  final ImpaktfullUiUnifiedScreenLayoutColorTheme colors;
  final ImpaktfullUiUnifiedScreenLayoutDimensTheme dimens;
  final ImpaktfullUiUnifiedScreenLayoutTextStyleTheme textStyles;

  const ImpaktfullUiUnifiedScreenLayoutTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiUnifiedScreenLayoutTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.unifiedScreenLayout;
}

class ImpaktfullUiUnifiedScreenLayoutAssetsTheme {
  const ImpaktfullUiUnifiedScreenLayoutAssetsTheme();
}

class ImpaktfullUiUnifiedScreenLayoutColorTheme {
  const ImpaktfullUiUnifiedScreenLayoutColorTheme();
}

class ImpaktfullUiUnifiedScreenLayoutDimensTheme {
  final double centerWidthFactor;
  final double centerMinWidth;
  final double centerMaxWidth;
  final EdgeInsetsGeometry centerPadding;

  const ImpaktfullUiUnifiedScreenLayoutDimensTheme({
    required this.centerWidthFactor,
    required this.centerMinWidth,
    required this.centerMaxWidth,
    required this.centerPadding,
  });
}

class ImpaktfullUiUnifiedScreenLayoutTextStyleTheme {
  const ImpaktfullUiUnifiedScreenLayoutTextStyleTheme();
}
