import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiScreenTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiScreenAssetsTheme assets;
  final ImpaktfullUiScreenColorTheme colors;
  final ImpaktfullUiScreenDimensTheme dimens;
  final ImpaktfullUiScreenTextStyleTheme textStyles;

  const ImpaktfullUiScreenTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiScreenTheme copyWith({
    ImpaktfullUiScreenAssetsTheme? assets,
    ImpaktfullUiScreenColorTheme? colors,
    ImpaktfullUiScreenDimensTheme? dimens,
    ImpaktfullUiScreenTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiScreenTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiScreenTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.screen;

  static ImpaktfullUiScreenTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiScreenTheme(
        assets: const ImpaktfullUiScreenAssetsTheme(),
        colors: ImpaktfullUiScreenColorTheme(
          background: colors.canvas,
        ),
        dimens: const ImpaktfullUiScreenDimensTheme(),
        textStyles: const ImpaktfullUiScreenTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiScreenTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiScreenAssetsTheme {
  const ImpaktfullUiScreenAssetsTheme();

  ImpaktfullUiScreenAssetsTheme copyWith() =>
      const ImpaktfullUiScreenAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiScreenAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiScreenColorTheme {
  final Color background;
  const ImpaktfullUiScreenColorTheme({
    required this.background,
  });

  ImpaktfullUiScreenColorTheme copyWith({
    Color? background,
  }) =>
      ImpaktfullUiScreenColorTheme(
        background: background ?? this.background,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiScreenColorTheme && background == other.background;

  @override
  int get hashCode => background.hashCode;
}

class ImpaktfullUiScreenDimensTheme {
  /// The space between the floating action button and the edges of the
  /// screen. The safe area of the device is added to it.
  final EdgeInsetsGeometry floatingActionButtonPadding;

  const ImpaktfullUiScreenDimensTheme({
    this.floatingActionButtonPadding = const EdgeInsets.all(16),
  });

  ImpaktfullUiScreenDimensTheme copyWith({
    EdgeInsetsGeometry? floatingActionButtonPadding,
  }) =>
      ImpaktfullUiScreenDimensTheme(
        floatingActionButtonPadding:
            floatingActionButtonPadding ?? this.floatingActionButtonPadding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiScreenDimensTheme &&
          floatingActionButtonPadding == other.floatingActionButtonPadding;

  @override
  int get hashCode => floatingActionButtonPadding.hashCode;
}

class ImpaktfullUiScreenTextStyleTheme {
  const ImpaktfullUiScreenTextStyleTheme();

  ImpaktfullUiScreenTextStyleTheme copyWith() =>
      const ImpaktfullUiScreenTextStyleTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiScreenTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
