import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiDateInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiDateInputFieldAssetsTheme assets;
  final ImpaktfullUiDateInputFieldColorTheme colors;
  final ImpaktfullUiDateInputFieldDimensTheme dimens;
  final ImpaktfullUiDateInputFieldTextStyleTheme textStyles;

  const ImpaktfullUiDateInputFieldTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiDateInputFieldTheme copyWith({
    ImpaktfullUiDateInputFieldAssetsTheme? assets,
    ImpaktfullUiDateInputFieldColorTheme? colors,
    ImpaktfullUiDateInputFieldDimensTheme? dimens,
    ImpaktfullUiDateInputFieldTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiDateInputFieldTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiDateInputFieldTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.dateInputField;

  static ImpaktfullUiDateInputFieldTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiDateInputFieldTheme(
        assets: const ImpaktfullUiDateInputFieldAssetsTheme(),
        colors: ImpaktfullUiDateInputFieldColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
        ),
        dimens: ImpaktfullUiDateInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiDateInputFieldTextStyleTheme(
          label: textStyles.onCard.text.small.medium,
          text: textStyles.onCard.text.medium,
          placeholder: textStyles.onCardTertiary.text.medium.copyWith(
              color: textStyles.onCardTertiary.text.medium.color
                  ?.withOpacityPercentage(0.5)),
          hint: textStyles.onCardTertiary.text.small,
          error: textStyles.onCardDestructive.text.small.medium
              .copyWith(color: colors.error),
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateInputFieldTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, textStyles);
}

class ImpaktfullUiDateInputFieldAssetsTheme {
  const ImpaktfullUiDateInputFieldAssetsTheme();

  ImpaktfullUiDateInputFieldAssetsTheme copyWith() =>
      const ImpaktfullUiDateInputFieldAssetsTheme();

  @override
  bool operator ==(Object other) =>
      other is ImpaktfullUiDateInputFieldAssetsTheme;

  @override
  int get hashCode => runtimeType.hashCode;
}

class ImpaktfullUiDateInputFieldColorTheme {
  final Color background;
  final Color border;
  final Color borderError;

  const ImpaktfullUiDateInputFieldColorTheme({
    required this.background,
    required this.border,
    required this.borderError,
  });

  ImpaktfullUiDateInputFieldColorTheme copyWith({
    Color? background,
    Color? border,
    Color? borderError,
  }) =>
      ImpaktfullUiDateInputFieldColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        borderError: borderError ?? this.borderError,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateInputFieldColorTheme &&
          background == other.background &&
          border == other.border &&
          borderError == other.borderError;

  @override
  int get hashCode => Object.hash(background, border, borderError);
}

class ImpaktfullUiDateInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding between the border of the field and its content.
  final EdgeInsetsGeometry padding;

  /// The space above and below the date.
  ///
  /// Set it to `EdgeInsets.zero` together with [minHeight] for a field whose
  /// height is declared instead of derived, like Ant Design's
  /// `controlHeight: 32`.
  final EdgeInsetsGeometry contentPadding;

  /// The minimum height of the field, without its label, hint and error.
  final double minHeight;

  /// The space between the leading icon and the date.
  final double spacing;

  /// The size of the `leadingIcon`.
  final double iconSize;

  /// The width of the border of the field.
  ///
  /// Null (the default) keeps the `borderWidth` of
  /// `ImpaktfullUiCardDimensTheme`: the field draws its border with an
  /// `ImpaktfullUiCard`.
  final double? borderWidth;

  // Every parameter below `borderRadius` is optional, with the value the widget
  // hardcoded before it was a token as its default. They become `required` in
  // 1.0.0.
  const ImpaktfullUiDateInputFieldDimensTheme({
    required this.borderRadius,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 8),
    this.minHeight = 40,
    this.spacing = 8,
    this.iconSize = 20,
    this.borderWidth,
  });

  ImpaktfullUiDateInputFieldDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    EdgeInsetsGeometry? contentPadding,
    double? iconSize,
    double? minHeight,
    EdgeInsetsGeometry? padding,
    double? spacing,
  }) =>
      ImpaktfullUiDateInputFieldDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        contentPadding: contentPadding ?? this.contentPadding,
        iconSize: iconSize ?? this.iconSize,
        minHeight: minHeight ?? this.minHeight,
        padding: padding ?? this.padding,
        spacing: spacing ?? this.spacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateInputFieldDimensTheme &&
          borderRadius == other.borderRadius &&
          padding == other.padding &&
          contentPadding == other.contentPadding &&
          minHeight == other.minHeight &&
          spacing == other.spacing &&
          iconSize == other.iconSize &&
          borderWidth == other.borderWidth;

  @override
  int get hashCode => Object.hash(borderRadius, padding, contentPadding,
      minHeight, spacing, iconSize, borderWidth);
}

class ImpaktfullUiDateInputFieldTextStyleTheme {
  final TextStyle label;
  final TextStyle text;
  final TextStyle placeholder;
  final TextStyle hint;
  final TextStyle error;

  const ImpaktfullUiDateInputFieldTextStyleTheme({
    required this.label,
    required this.text,
    required this.placeholder,
    required this.hint,
    required this.error,
  });

  ImpaktfullUiDateInputFieldTextStyleTheme copyWith({
    TextStyle? error,
    TextStyle? hint,
    TextStyle? label,
    TextStyle? placeholder,
    TextStyle? text,
  }) =>
      ImpaktfullUiDateInputFieldTextStyleTheme(
        error: error ?? this.error,
        hint: hint ?? this.hint,
        label: label ?? this.label,
        placeholder: placeholder ?? this.placeholder,
        text: text ?? this.text,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateInputFieldTextStyleTheme &&
          label == other.label &&
          text == other.text &&
          placeholder == other.placeholder &&
          hint == other.hint &&
          error == other.error;

  @override
  int get hashCode => Object.hash(label, text, placeholder, hint, error);
}
