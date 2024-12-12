import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiResponsiveLayoutTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiResponsiveLayoutAssetsTheme assets;
  final ImpaktfullUiResponsiveLayoutColorTheme colors;
  final ImpaktfullUiResponsiveLayoutDimensTheme dimens;
  final ImpaktfullUiResponsiveLayoutTextStyleTheme textStyles;

  const ImpaktfullUiResponsiveLayoutTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiResponsiveLayoutTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.responsiveLayout;
}

class ImpaktfullUiResponsiveLayoutAssetsTheme {
  const ImpaktfullUiResponsiveLayoutAssetsTheme();
}

class ImpaktfullUiResponsiveLayoutColorTheme {
  const ImpaktfullUiResponsiveLayoutColorTheme();
}

class ImpaktfullUiResponsiveLayoutDimensTheme {
  final double breakpointSmall;
  final double breakpointMedium;
  final double breakpointLarge;
  final double breakpointExtraLarge;
  const ImpaktfullUiResponsiveLayoutDimensTheme({
    required this.breakpointSmall,
    required this.breakpointMedium,
    required this.breakpointLarge,
    required this.breakpointExtraLarge,
  });
}

class ImpaktfullUiResponsiveLayoutTextStyleTheme {
  const ImpaktfullUiResponsiveLayoutTextStyleTheme();
}
