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

  ImpaktfullUiBottomActionsTheme copyWith({
    ImpaktfullUiBottomActionsAssetsTheme? assets,
    ImpaktfullUiBottomActionsColorTheme? colors,
    ImpaktfullUiBottomActionsDimensTheme? dimens,
    ImpaktfullUiBottomActionsShadowsTheme? shadows,
    ImpaktfullUiBottomActionsTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiBottomActionsTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

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

  ImpaktfullUiBottomActionsAssetsTheme copyWith() =>
      const ImpaktfullUiBottomActionsAssetsTheme();
}

class ImpaktfullUiBottomActionsColorTheme {
  final Color background;

  const ImpaktfullUiBottomActionsColorTheme({
    required this.background,
  });

  ImpaktfullUiBottomActionsColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiBottomActionsColorTheme(
        background: background ?? this.background,
      );
}

class ImpaktfullUiBottomActionsDimensTheme {
  final EdgeInsets padding;
  final double spacing;

  const ImpaktfullUiBottomActionsDimensTheme({
    required this.padding,
    required this.spacing,
  });

  ImpaktfullUiBottomActionsDimensTheme copyWith({
    EdgeInsets? padding,
    double? spacing,
  }) =>
      ImpaktfullUiBottomActionsDimensTheme(
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );
}

class ImpaktfullUiBottomActionsShadowsTheme {
  final List<BoxShadow>? shadow;

  const ImpaktfullUiBottomActionsShadowsTheme({
    required this.shadow,
  });

  ImpaktfullUiBottomActionsShadowsTheme copyWith({
    List<BoxShadow>? shadow,
  }) =>
      ImpaktfullUiBottomActionsShadowsTheme(
        shadow: shadow ?? this.shadow,
      );
}

class ImpaktfullUiBottomActionsTextStyleTheme {
  const ImpaktfullUiBottomActionsTextStyleTheme();

  ImpaktfullUiBottomActionsTextStyleTheme copyWith() =>
      const ImpaktfullUiBottomActionsTextStyleTheme();
}
