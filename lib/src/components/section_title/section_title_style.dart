import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiSectionTitleTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiSectionTitleAssetsTheme assets;
  final ImpaktfullUiSectionTitleColorTheme colors;
  final ImpaktfullUiSectionTitleDimensTheme dimens;
  final ImpaktfullUiSectionTitleTextStyleTheme textStyles;

  const ImpaktfullUiSectionTitleTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiSectionTitleTheme copyWith({
    ImpaktfullUiSectionTitleAssetsTheme? assets,
    ImpaktfullUiSectionTitleColorTheme? colors,
    ImpaktfullUiSectionTitleDimensTheme? dimens,
    ImpaktfullUiSectionTitleTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiSectionTitleTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiSectionTitleTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.sectionTitle;

  static ImpaktfullUiSectionTitleTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiSectionTitleTheme(
        assets: const ImpaktfullUiSectionTitleAssetsTheme(),
        colors: ImpaktfullUiSectionTitleColorTheme(
          icons: colors.text,
        ),
        dimens: const ImpaktfullUiSectionTitleDimensTheme(
          margin: EdgeInsetsDirectional.only(
            start: 16,
            end: 16,
            top: 16,
          ),
          marginWithIconButtonActions: EdgeInsetsDirectional.only(
            start: 16,
            end: 4,
          ),
        ),
        textStyles: ImpaktfullUiSectionTitleTextStyleTheme(
          title: textStyles.onCard.text.small.medium,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiSectionTitleAssetsTheme {
  const ImpaktfullUiSectionTitleAssetsTheme();

  ImpaktfullUiSectionTitleAssetsTheme copyWith() =>
      const ImpaktfullUiSectionTitleAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiSectionTitleAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiSectionTitleColorTheme {
  final Color icons;
  const ImpaktfullUiSectionTitleColorTheme({
    required this.icons,
  });

  ImpaktfullUiSectionTitleColorTheme copyWith({
    Color? icons,
  }) =>
      ImpaktfullUiSectionTitleColorTheme(
        icons: icons ?? this.icons,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleColorTheme && icons == other.icons;

  @override
  int get hashCode => icons.hashCode;
}

class ImpaktfullUiSectionTitleDimensTheme {
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry marginWithIconButtonActions;

  /// The space between the title and the actions.
  final double spacing;

  const ImpaktfullUiSectionTitleDimensTheme({
    required this.margin,
    required this.marginWithIconButtonActions,
    this.spacing = 8,
  });

  ImpaktfullUiSectionTitleDimensTheme copyWith({
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? marginWithIconButtonActions,
    double? spacing,
  }) =>
      ImpaktfullUiSectionTitleDimensTheme(
        margin: margin ?? this.margin,
        marginWithIconButtonActions:
            marginWithIconButtonActions ?? this.marginWithIconButtonActions,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleDimensTheme &&
          margin == other.margin &&
          marginWithIconButtonActions == other.marginWithIconButtonActions &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(margin, marginWithIconButtonActions, spacing);
}

class ImpaktfullUiSectionTitleTextStyleTheme {
  final TextStyle title;
  const ImpaktfullUiSectionTitleTextStyleTheme({
    required this.title,
  });

  ImpaktfullUiSectionTitleTextStyleTheme copyWith({
    TextStyle? title,
  }) =>
      ImpaktfullUiSectionTitleTextStyleTheme(
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiSectionTitleTextStyleTheme && title == other.title;

  @override
  int get hashCode => title.hashCode;
}
