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

  const ImpaktfullUiDateInputFieldDimensTheme({
    required this.borderRadius,
  });

  ImpaktfullUiDateInputFieldDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
  }) =>
      ImpaktfullUiDateInputFieldDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiDateInputFieldDimensTheme &&
          borderRadius == other.borderRadius;

  @override
  int get hashCode => borderRadius.hashCode;
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
