import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';

class ImpaktfullUiChipTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiChipAssetsTheme assets;
  final ImpaktfullUiChipColorTheme colors;
  final ImpaktfullUiChipDimensTheme dimens;
  final ImpaktfullUiChipTextStyleTheme textStyles;

  const ImpaktfullUiChipTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  /// The look of a chip in an [ImpaktfullUiComponentsTheme] that is created
  /// without a `chip`: the colors of the light impaktfull theme. It does not
  /// depend on the base tokens of the theme, [getDefault] does.
  static const fallback = ImpaktfullUiChipTheme(
    assets: ImpaktfullUiChipAssetsTheme(),
    colors: ImpaktfullUiChipColorTheme(
      background: Color(0xFFFFFFFF),
      backgroundSelected: Color(0xFF7D64F2),
      border: Color(0x339E9E9E),
      borderSelected: Color(0xFF7D64F2),
      text: Color(0xFF344054),
      textSelected: Color(0xFFFFFFFF),
    ),
    dimens: ImpaktfullUiChipDimensTheme(),
    textStyles: ImpaktfullUiChipTextStyleTheme(
      title: TextStyle(fontSize: 14),
      titleSelected: TextStyle(fontSize: 14),
    ),
  );

  ImpaktfullUiChipTheme copyWith({
    ImpaktfullUiChipAssetsTheme? assets,
    ImpaktfullUiChipColorTheme? colors,
    ImpaktfullUiChipDimensTheme? dimens,
    ImpaktfullUiChipTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiChipTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiChipTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.chip;

  /// A selected chip is filled with the accent color, like a checked
  /// checkbox, and an unselected one is a card with a border.
  static ImpaktfullUiChipTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiChipTheme(
        assets: const ImpaktfullUiChipAssetsTheme(),
        colors: ImpaktfullUiChipColorTheme(
          background: colors.card,
          backgroundSelected: colors.accent,
          border: colors.border,
          borderSelected: colors.accent,
          text: colors.text,
          textSelected: colors.textOnAccent,
        ),
        dimens: ImpaktfullUiChipDimensTheme(
          borderRadius: dimens.borderRadiusCircle,
        ),
        textStyles: ImpaktfullUiChipTextStyleTheme(
          title: textStyles.onCard.text.small,
          titleSelected: textStyles.onAccent.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiChipTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

/// The chip has no assets of its own: the leading asset is passed to the
/// chip.
class ImpaktfullUiChipAssetsTheme {
  const ImpaktfullUiChipAssetsTheme();

  ImpaktfullUiChipAssetsTheme copyWith() => const ImpaktfullUiChipAssetsTheme();

  @override
  bool operator ==(Object other) => other is ImpaktfullUiChipAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiChipColorTheme {
  /// The background of a chip that is not selected.
  final Color background;

  /// The background of a selected chip.
  final Color backgroundSelected;

  /// The border of a chip that is not selected.
  final Color border;

  /// The border of a selected chip.
  final Color borderSelected;

  /// The color of the title and the leading asset of a chip that is not
  /// selected.
  final Color text;

  /// The color of the title and the leading asset of a selected chip.
  final Color textSelected;

  const ImpaktfullUiChipColorTheme({
    required this.background,
    required this.backgroundSelected,
    required this.border,
    required this.borderSelected,
    required this.text,
    required this.textSelected,
  });

  ImpaktfullUiChipColorTheme copyWith({
    Color? background,
    Color? backgroundSelected,
    Color? border,
    Color? borderSelected,
    Color? text,
    Color? textSelected,
  }) =>
      ImpaktfullUiChipColorTheme(
        background: background ?? this.background,
        backgroundSelected: backgroundSelected ?? this.backgroundSelected,
        border: border ?? this.border,
        borderSelected: borderSelected ?? this.borderSelected,
        text: text ?? this.text,
        textSelected: textSelected ?? this.textSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiChipColorTheme &&
          background == other.background &&
          backgroundSelected == other.backgroundSelected &&
          border == other.border &&
          borderSelected == other.borderSelected &&
          text == other.text &&
          textSelected == other.textSelected;

  @override
  int get hashCode => Object.hash(
        background,
        backgroundSelected,
        border,
        borderSelected,
        text,
        textSelected,
      );
}

class ImpaktfullUiChipDimensTheme {
  /// The radius of the chip: a pill (`borderRadiusCircle`) by default.
  final BorderRadiusGeometry borderRadius;

  /// The width of the border, selected or not.
  final double borderWidth;

  /// The opacity of a disabled chip (`onTap: null`).
  final double disabledOpacity;

  /// The size of the leading asset.
  final double iconSize;

  /// The minimum height of the chip. It grows with its content, e.g. for a
  /// large text scale.
  final double minHeight;

  /// Opt-in: the minimum size of the tap area, e.g. `Size.square(48)` for
  /// the Android and `Size.square(44)` for the iOS tap target guideline.
  ///
  /// The chip looks the same, but takes at least this much space in the
  /// layout. Null (the default) keeps the size of the chip.
  final Size? minTapTargetSize;

  /// The space between the border and the content.
  final EdgeInsetsGeometry padding;

  /// The space between the leading asset and the title.
  final double spacing;

  const ImpaktfullUiChipDimensTheme({
    this.borderRadius = const BorderRadius.all(
      Radius.circular(ImpaktfullUiDimensTheme.borderRadiusCircleMax),
    ),
    this.borderWidth = 1,
    this.disabledOpacity = 0.5,
    this.iconSize = 16,
    this.minHeight = 32,
    this.minTapTargetSize,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    this.spacing = 8,
  });

  ImpaktfullUiChipDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? disabledOpacity,
    double? iconSize,
    double? minHeight,
    Size? minTapTargetSize,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiChipDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        disabledOpacity: disabledOpacity ?? this.disabledOpacity,
        iconSize: iconSize ?? this.iconSize,
        minHeight: minHeight ?? this.minHeight,
        minTapTargetSize: minTapTargetSize ?? this.minTapTargetSize,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiChipDimensTheme &&
          borderRadius == other.borderRadius &&
          borderWidth == other.borderWidth &&
          disabledOpacity == other.disabledOpacity &&
          iconSize == other.iconSize &&
          minHeight == other.minHeight &&
          minTapTargetSize == other.minTapTargetSize &&
          padding == other.padding &&
          spacing == other.spacing;

  @override
  int get hashCode => Object.hash(
        borderRadius,
        borderWidth,
        disabledOpacity,
        iconSize,
        minHeight,
        minTapTargetSize,
        padding,
        spacing,
      );
}

class ImpaktfullUiChipTextStyleTheme {
  /// The title of a chip that is not selected. Its color is
  /// `colors.text`.
  final TextStyle title;

  /// The title of a selected chip. Its color is `colors.textSelected`.
  final TextStyle titleSelected;

  const ImpaktfullUiChipTextStyleTheme({
    required this.title,
    required this.titleSelected,
  });

  ImpaktfullUiChipTextStyleTheme copyWith({
    TextStyle? title,
    TextStyle? titleSelected,
  }) =>
      ImpaktfullUiChipTextStyleTheme(
        title: title ?? this.title,
        titleSelected: titleSelected ?? this.titleSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiChipTextStyleTheme &&
          title == other.title &&
          titleSelected == other.titleSelected;

  @override
  int get hashCode => Object.hash(title, titleSelected);
}
