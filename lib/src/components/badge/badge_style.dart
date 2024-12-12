import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBadgeAssetsTheme assets;
  final ImpaktfullUiBadgeColorTheme colors;
  final ImpaktfullUiBadgeDimensTheme dimens;
  final ImpaktfullUiBadgeTextStylesTheme textStyles;

  const ImpaktfullUiBadgeTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiBadgeTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.badge;
}

class ImpaktfullUiBadgeAssetsTheme {
  final ImpaktfullUiAsset close;

  const ImpaktfullUiBadgeAssetsTheme({
    required this.close,
  });
}

class ImpaktfullUiBadgeColorTheme {
  final Color primaryText;
  final Color primaryBorder;
  final Color primaryBackground;
  final Color secondaryText;
  final Color secondaryBorder;
  final Color secondaryBackground;
  final Color neutralText;
  final Color neutralBorder;
  final Color neutralBackground;
  final Color errorText;
  final Color errorBorder;
  final Color errorBackground;
  final Color warningText;
  final Color warningBorder;
  final Color warningBackground;
  final Color successText;
  final Color successBorder;
  final Color successBackground;

  const ImpaktfullUiBadgeColorTheme({
    required this.primaryText,
    required this.primaryBorder,
    required this.primaryBackground,
    required this.secondaryText,
    required this.secondaryBorder,
    required this.secondaryBackground,
    required this.neutralText,
    required this.neutralBorder,
    required this.neutralBackground,
    required this.errorText,
    required this.errorBorder,
    required this.errorBackground,
    required this.warningText,
    required this.warningBorder,
    required this.warningBackground,
    required this.successText,
    required this.successBorder,
    required this.successBackground,
  });
}

class ImpaktfullUiBadgeDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
  });
}

class ImpaktfullUiBadgeTextStylesTheme {
  final TextStyle small;
  final TextStyle medium;
  final TextStyle large;

  const ImpaktfullUiBadgeTextStylesTheme({
    required this.small,
    required this.medium,
    required this.large,
  });
}
