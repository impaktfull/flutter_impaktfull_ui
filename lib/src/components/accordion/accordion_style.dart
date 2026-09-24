import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiAccordionTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiAccordionAssetsTheme assets;
  final ImpaktfullUiAccordionColorTheme colors;
  final ImpaktfullUiAccordionDimensTheme dimens;
  final ImpaktfullUiAccordionDurationsTheme durations;
  final ImpaktfullUiAccordionTextStyleTheme textStyles;

  const ImpaktfullUiAccordionTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiAccordionDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiAccordionTheme copyWith({
    ImpaktfullUiAccordionAssetsTheme? assets,
    ImpaktfullUiAccordionColorTheme? colors,
    ImpaktfullUiAccordionDimensTheme? dimens,
    ImpaktfullUiAccordionDurationsTheme? durations,
    ImpaktfullUiAccordionTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiAccordionTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiAccordionTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.accordion;

  static ImpaktfullUiAccordionTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiAccordionTheme(
        assets: ImpaktfullUiAccordionAssetsTheme(
          chevronDown: assets.icons.chevronDown,
        ),
        colors: const ImpaktfullUiAccordionColorTheme(),
        dimens: const ImpaktfullUiAccordionDimensTheme(),
        durations: ImpaktfullUiAccordionDurationsTheme(
          expand: durations.short,
        ),
        textStyles: const ImpaktfullUiAccordionTextStyleTheme(),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAccordionTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          durations == other.durations &&
          textStyles == other.textStyles;

  @override
  int get hashCode =>
      Object.hash(assets, colors, dimens, durations, textStyles);
}

class ImpaktfullUiAccordionAssetsTheme {
  final ImpaktfullUiAsset chevronDown;
  const ImpaktfullUiAccordionAssetsTheme({
    required this.chevronDown,
  });

  ImpaktfullUiAccordionAssetsTheme copyWith({
    ImpaktfullUiAsset? chevronDown,
  }) =>
      ImpaktfullUiAccordionAssetsTheme(
        chevronDown: chevronDown ?? this.chevronDown,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAccordionAssetsTheme &&
          chevronDown == other.chevronDown;

  @override
  int get hashCode => chevronDown.hashCode;
}

class ImpaktfullUiAccordionDurationsTheme {
  /// How long the accordion takes to expand or collapse, and how long the
  /// chevron takes to turn.
  final Duration expand;

  const ImpaktfullUiAccordionDurationsTheme({
    this.expand = const Duration(milliseconds: 200),
  });

  ImpaktfullUiAccordionDurationsTheme copyWith({
    Duration? expand,
  }) =>
      ImpaktfullUiAccordionDurationsTheme(
        expand: expand ?? this.expand,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiAccordionDurationsTheme && expand == other.expand;

  @override
  int get hashCode => expand.hashCode;
}

class ImpaktfullUiAccordionColorTheme {
  const ImpaktfullUiAccordionColorTheme();

  ImpaktfullUiAccordionColorTheme copyWith() =>
      const ImpaktfullUiAccordionColorTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiAccordionColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiAccordionDimensTheme {
  const ImpaktfullUiAccordionDimensTheme();

  ImpaktfullUiAccordionDimensTheme copyWith() =>
      const ImpaktfullUiAccordionDimensTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiAccordionDimensTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiAccordionTextStyleTheme {
  const ImpaktfullUiAccordionTextStyleTheme();

  ImpaktfullUiAccordionTextStyleTheme copyWith() =>
      const ImpaktfullUiAccordionTextStyleTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiAccordionTextStyleTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}
