import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiBottomActionsTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiBottomActionsAssetsTheme assets;
  final ImpaktfullUiBottomActionsColorTheme colors;
  final ImpaktfullUiBottomActionsDimensTheme dimens;
  final ImpaktfullUiBottomActionsShadowsTheme shadows;
  final ImpaktfullUiBottomActionsTextStyleTheme textStyles;

  const ImpaktfullUiBottomActionsTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  static ImpaktfullUiBottomActionsTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.bottomActions;

  static ImpaktfullUiBottomActionsTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiBottomActionsTheme(
        assets: const ImpaktfullUiBottomActionsAssetsTheme(),
        colors: ImpaktfullUiBottomActionsColorTheme(
          background: colors.card,
        ),
        dimens: const ImpaktfullUiBottomActionsDimensTheme(
          padding: EdgeInsets.all(16),
          spacing: 8,
        ),
        shadows: ImpaktfullUiBottomActionsShadowsTheme(
          shadow: shadows.medium,
        ),
        textStyles: const ImpaktfullUiBottomActionsTextStyleTheme(),
      );
}

class ImpaktfullUiBottomActionsAssetsTheme {
  const ImpaktfullUiBottomActionsAssetsTheme();
}

class ImpaktfullUiBottomActionsColorTheme {
  final Color background;

  const ImpaktfullUiBottomActionsColorTheme({
    required this.background,
  });
}

class ImpaktfullUiBottomActionsDimensTheme {
  final EdgeInsets padding;
  final double spacing;

  const ImpaktfullUiBottomActionsDimensTheme({
    required this.padding,
    required this.spacing,
  });
}

class ImpaktfullUiBottomActionsShadowsTheme {
  final List<BoxShadow>? shadow;

  const ImpaktfullUiBottomActionsShadowsTheme({
    required this.shadow,
  });
}

class ImpaktfullUiBottomActionsTextStyleTheme {
  const ImpaktfullUiBottomActionsTextStyleTheme();
}
