import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiSnackyConfiguratorTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSnackyConfiguratorColorTheme colors;
  final ImpaktfullUiSnackyConfiguratorTextStylesTheme textStyles;
  final ImpaktfullUiSnackyConfiguratorDimensTheme dimens;

  const ImpaktfullUiSnackyConfiguratorTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiSnackyConfiguratorTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.snackyConfigurator;
}

class ImpaktfullUiSnackyConfiguratorColorTheme {
  final Color brand;
  final Color error;
  final Color info;
  final Color warning;
  final Color success;

  const ImpaktfullUiSnackyConfiguratorColorTheme({
    required this.brand,
    required this.error,
    required this.info,
    required this.warning,
    required this.success,
  });
}

class ImpaktfullUiSnackyConfiguratorTextStylesTheme {
  const ImpaktfullUiSnackyConfiguratorTextStylesTheme();
}

class ImpaktfullUiSnackyConfiguratorDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiSnackyConfiguratorDimensTheme({
    required this.borderRadius,
  });
}
