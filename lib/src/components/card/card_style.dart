import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiCardTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCardColorTheme colors;
  final ImpaktfullUiCardDimensTheme dimens;
  final ImpaktfullUiCardShadowsTheme shadows;

  const ImpaktfullUiCardTheme({
    required this.colors,
    required this.dimens,
    required this.shadows,
  });

  static ImpaktfullUiCardTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.card;
}

class ImpaktfullUiCardColorTheme {
  final Color background;
  final Color? border;
  final Color? borderError;

  const ImpaktfullUiCardColorTheme({
    required this.background,
    required this.border,
    required this.borderError,
  });
}

class ImpaktfullUiCardDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  const ImpaktfullUiCardDimensTheme({
    required this.borderRadius,
    required this.padding,
  });
}

class ImpaktfullUiCardShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiCardShadowsTheme({
    required this.card,
  });
}
