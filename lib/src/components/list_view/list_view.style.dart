import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiListViewTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiListViewTextStyleTheme textStyles;
  final ImpaktfullUiListViewDimensTheme dimens;

  const ImpaktfullUiListViewTheme({
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiListViewTheme copyWith({
    ImpaktfullUiListViewDimensTheme? dimens,
    ImpaktfullUiListViewTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiListViewTheme(
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiListViewTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.listView;

  static ImpaktfullUiListViewTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiListViewTheme(
        dimens: ImpaktfullUiListViewDimensTheme(
          borderRadius: dimens.borderRadius,
          padding: const EdgeInsets.all(16),
        ),
        textStyles: ImpaktfullUiListViewTextStyleTheme(
          title: textStyles.onCanvas.display.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListViewTheme &&
          textStyles == other.textStyles &&
          dimens == other.dimens;

  @override
  int get hashCode => Object.hash(textStyles, dimens);
}

class ImpaktfullUiListViewTextStyleTheme {
  final TextStyle title;

  const ImpaktfullUiListViewTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiListViewTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiListViewTextStyleTheme(
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListViewTextStyleTheme && title == other.title;

  @override
  int get hashCode => title.hashCode;
}

class ImpaktfullUiListViewDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets padding;

  const ImpaktfullUiListViewDimensTheme({
    required this.borderRadius,
    required this.padding,
  });

  ImpaktfullUiListViewDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? padding,
  }) =>
      ImpaktfullUiListViewDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        padding: padding ?? this.padding,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiListViewDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding;

  @override
  int get hashCode => Object.hash(borderRadius, padding);
}
