import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiHorizontalTabsTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiHorizontalTabsColorTheme colors;
  final ImpaktfullUiHorizontalTabsDimensTheme dimens;

  const ImpaktfullUiHorizontalTabsTheme({
    required this.colors,
    required this.dimens,
  });

  ImpaktfullUiHorizontalTabsTheme copyWith({
    ImpaktfullUiHorizontalTabsColorTheme? colors,
    ImpaktfullUiHorizontalTabsDimensTheme? dimens,
  }) =>
      ImpaktfullUiHorizontalTabsTheme(
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
      );

  static ImpaktfullUiHorizontalTabsTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.horizontalTabs;

  static ImpaktfullUiHorizontalTabsTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      const ImpaktfullUiHorizontalTabsTheme(
        colors: ImpaktfullUiHorizontalTabsColorTheme(),
        dimens: ImpaktfullUiHorizontalTabsDimensTheme(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabsTheme &&
          colors == other.colors &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(colors, dimens);
}

class ImpaktfullUiHorizontalTabsColorTheme {
  const ImpaktfullUiHorizontalTabsColorTheme();

  ImpaktfullUiHorizontalTabsColorTheme copyWith() =>
      const ImpaktfullUiHorizontalTabsColorTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiHorizontalTabsColorTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiHorizontalTabsDimensTheme {
  final EdgeInsets padding;

  /// The height of the row of tabs.
  final double height;

  /// The space between two tabs.
  final double spacing;

  const ImpaktfullUiHorizontalTabsDimensTheme({
    required this.padding,
    this.height = 48,
    this.spacing = 8,
  });

  ImpaktfullUiHorizontalTabsDimensTheme copyWith({
    double? height,
    EdgeInsets? padding,
    double? spacing,
  }) =>
      ImpaktfullUiHorizontalTabsDimensTheme(
        height: height ?? this.height,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiHorizontalTabsDimensTheme &&
          padding == other.padding &&
          height == other.height &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(padding, height, spacing);
}
