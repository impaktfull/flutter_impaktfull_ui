import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

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

  static ImpaktfullUiCardTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCardTheme(
        colors: ImpaktfullUiCardColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
        ),
        dimens: ImpaktfullUiCardDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.all(16),
          borderWidth: 1,
        ),
        shadows: ImpaktfullUiCardShadowsTheme(
          card: shadows.small,
        ),
      );
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
  final double borderWidth;

  const ImpaktfullUiCardDimensTheme({
    required this.borderRadius,
    required this.padding,
    required this.borderWidth,
  });
}

class ImpaktfullUiCardShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiCardShadowsTheme({
    required this.card,
  });
}
