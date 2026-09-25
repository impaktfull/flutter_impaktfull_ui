import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiCommandMenuTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiCommandMenuAssetsTheme assets;
  final ImpaktfullUiCommandMenuColorTheme colors;
  final ImpaktfullUiCommandMenuDimensTheme dimens;
  final ImpaktfullUiCommandMenuTextStyleTheme textStyles;

  const ImpaktfullUiCommandMenuTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiCommandMenuTheme copyWith({
    ImpaktfullUiCommandMenuAssetsTheme? assets,
    ImpaktfullUiCommandMenuColorTheme? colors,
    ImpaktfullUiCommandMenuDimensTheme? dimens,
    ImpaktfullUiCommandMenuTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiCommandMenuTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiCommandMenuTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.commandMenu;

  static ImpaktfullUiCommandMenuTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiCommandMenuTheme(
        assets: const ImpaktfullUiCommandMenuAssetsTheme(),
        colors: const ImpaktfullUiCommandMenuColorTheme(),
        dimens: ImpaktfullUiCommandMenuDimensTheme(
          windowBorderRadius: dimens.borderRadiusLarge,
        ),
        textStyles: const ImpaktfullUiCommandMenuTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCommandMenuTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiCommandMenuAssetsTheme {
  const ImpaktfullUiCommandMenuAssetsTheme();

  ImpaktfullUiCommandMenuAssetsTheme copyWith() =>
      const ImpaktfullUiCommandMenuAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiCommandMenuAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiCommandMenuColorTheme {
  const ImpaktfullUiCommandMenuColorTheme();

  ImpaktfullUiCommandMenuColorTheme copyWith() =>
      const ImpaktfullUiCommandMenuColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiCommandMenuColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiCommandMenuDimensTheme {
  final BorderRadiusGeometry windowBorderRadius;

  /// The space between the parts of a result.
  final double spacing;

  /// The maximum height of the results.
  final double maxHeight;

  const ImpaktfullUiCommandMenuDimensTheme({
    required this.windowBorderRadius,
    this.spacing = 8,
    this.maxHeight = 200,
  });

  ImpaktfullUiCommandMenuDimensTheme copyWith({
    double? maxHeight,
    double? spacing,
    BorderRadiusGeometry? windowBorderRadius,
  }) =>
      ImpaktfullUiCommandMenuDimensTheme(
        maxHeight: maxHeight ?? this.maxHeight,
        spacing: spacing ?? this.spacing,
        windowBorderRadius: windowBorderRadius ?? this.windowBorderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiCommandMenuDimensTheme &&
          windowBorderRadius == other.windowBorderRadius &&
          spacing == other.spacing &&
          maxHeight == other.maxHeight;

  @override
  int get hashCode => Object.hash(windowBorderRadius, spacing, maxHeight);
}

class ImpaktfullUiCommandMenuTextStyleTheme {
  const ImpaktfullUiCommandMenuTextStyleTheme();

  ImpaktfullUiCommandMenuTextStyleTheme copyWith() =>
      const ImpaktfullUiCommandMenuTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiCommandMenuTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
