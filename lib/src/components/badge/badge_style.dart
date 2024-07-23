import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiBadgeTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBadgeColorTheme colors;
  final ImpaktfullUiBadgeDimensTheme dimens;

  const ImpaktfullUiBadgeTheme({
    required this.colors,
    required this.dimens,
  });

  static ImpaktfullUiBadgeTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.badge;
}

class ImpaktfullUiBadgeColorTheme {
  const ImpaktfullUiBadgeColorTheme();
}

class ImpaktfullUiBadgeDimensTheme {
  final BorderRadius borderRadius;

  const ImpaktfullUiBadgeDimensTheme({
    required this.borderRadius,
  });
}
