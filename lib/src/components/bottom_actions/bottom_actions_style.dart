import 'package:flutter/foundation.dart';
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomActionsTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          shadows == other.shadows &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, shadows, textStyles);
}

class ImpaktfullUiBottomActionsAssetsTheme {
  const ImpaktfullUiBottomActionsAssetsTheme();

  ImpaktfullUiBottomActionsAssetsTheme copyWith() =>
      const ImpaktfullUiBottomActionsAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomActionsAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomActionsColorTheme &&
          background == other.background;

  @override
  int get hashCode => background.hashCode;
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomActionsDimensTheme &&
          padding == other.padding &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(padding, spacing);
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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiBottomActionsShadowsTheme &&
          listEquals(shadow, other.shadow);

  @override
  int get hashCode => Object.hashAll(shadow ?? const []);
}

class ImpaktfullUiBottomActionsTextStyleTheme {
  const ImpaktfullUiBottomActionsTextStyleTheme();

  ImpaktfullUiBottomActionsTextStyleTheme copyWith() =>
      const ImpaktfullUiBottomActionsTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiBottomActionsTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
