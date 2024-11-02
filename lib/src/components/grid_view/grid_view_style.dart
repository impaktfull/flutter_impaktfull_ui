import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiGridViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiGridViewAssetsTheme assets;
  final ImpaktfullUiGridViewColorTheme colors;
  final ImpaktfullUiGridViewDimensTheme dimens;
  final ImpaktfullUiGridViewTextStyleTheme textStyles;

  const ImpaktfullUiGridViewTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiGridViewTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.gridView;
}

class ImpaktfullUiGridViewAssetsTheme {
  const ImpaktfullUiGridViewAssetsTheme();
}

class ImpaktfullUiGridViewColorTheme {
  const ImpaktfullUiGridViewColorTheme();
}

class ImpaktfullUiGridViewDimensTheme {
  const ImpaktfullUiGridViewDimensTheme();
}

class ImpaktfullUiGridViewTextStyleTheme {
  const ImpaktfullUiGridViewTextStyleTheme();
}
