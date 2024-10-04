import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBadgeColorTheme colors;
  final ImpaktfullUiBadgeDimensTheme dimens;
  final ImpaktfullUiBadgeAssetsTheme assets;

  const ImpaktfullUiBadgeTheme({
    required this.colors,
    required this.dimens,
    required this.assets,
  });

  static ImpaktfullUiBadgeTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.badge;
}

class ImpaktfullUiBadgeColorTheme {
  const ImpaktfullUiBadgeColorTheme();
}

class ImpaktfullUiBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiBadgeAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBadgeAssetsTheme({
    required this.close,
  });
}
