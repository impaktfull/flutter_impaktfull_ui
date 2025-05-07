import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiInputFieldAssetsTheme assets;
  final ImpaktfullUiInputFieldColorTheme colors;
  final ImpaktfullUiInputFieldDimensTheme dimens;
  final ImpaktfullUiInputFieldTextStylesTheme textStyles;

  const ImpaktfullUiInputFieldTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  ImpaktfullUiInputFieldTheme copyWith({
    ImpaktfullUiInputFieldAssetsTheme? assets,
    ImpaktfullUiInputFieldColorTheme? colors,
    ImpaktfullUiInputFieldDimensTheme? dimens,
    ImpaktfullUiInputFieldTextStylesTheme? textStyles,
  }) =>
      ImpaktfullUiInputFieldTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiInputFieldTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.inputField;

  static ImpaktfullUiInputFieldTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiInputFieldTheme(
        assets: ImpaktfullUiInputFieldAssetsTheme(
          passwordHide: assets.icons.passwordHide,
          passwordShow: assets.icons.passwordShow,
        ),
        colors: ImpaktfullUiInputFieldColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
          cursor: colors.accent,
          selection: colors.accent.withOpacityPercentage(0.3),
          selectionHandle: colors.accent,
        ),
        dimens: ImpaktfullUiInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
          labelMargin: EdgeInsets.zero,
        ),
        textStyles: ImpaktfullUiInputFieldTextStylesTheme(
          label: textStyles.onCard.text.small.medium,
          text: textStyles.onCard.text.medium,
          placeholder: textStyles.onCardTertiary.text.medium.copyWith(
              color: textStyles.onCardTertiary.text.medium.color
                  ?.withOpacityPercentage(0.5)),
          hint: textStyles.onCardTertiary.text.small,
          error: textStyles.onCardDestructive.text.small.medium
              .copyWith(color: colors.error),
          action: textStyles.onCard.text.small.medium,
        ),
      );
}

class ImpaktfullUiInputFieldAssetsTheme {
  final ImpaktfullUiAsset passwordHide;
  final ImpaktfullUiAsset passwordShow;

  const ImpaktfullUiInputFieldAssetsTheme({
    required this.passwordHide,
    required this.passwordShow,
  });

  ImpaktfullUiInputFieldAssetsTheme copyWith({
    ImpaktfullUiAsset? passwordHide,
    ImpaktfullUiAsset? passwordShow,
  }) =>
      ImpaktfullUiInputFieldAssetsTheme(
        passwordHide: passwordHide ?? this.passwordHide,
        passwordShow: passwordShow ?? this.passwordShow,
      );
}

class ImpaktfullUiInputFieldColorTheme {
  final Color background;
  final Color border;
  final Color borderError;
  final Color cursor;
  final Color selection;
  final Color selectionHandle;

  const ImpaktfullUiInputFieldColorTheme({
    required this.background,
    required this.border,
    required this.borderError,
    required this.cursor,
    required this.selection,
    required this.selectionHandle,
  });

  ImpaktfullUiInputFieldColorTheme copyWith({
    Color? background,
    Color? border,
    Color? borderError,
    Color? cursor,
    Color? selection,
    Color? selectionHandle,
  }) =>
      ImpaktfullUiInputFieldColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        borderError: borderError ?? this.borderError,
        cursor: cursor ?? this.cursor,
        selection: selection ?? this.selection,
        selectionHandle: selectionHandle ?? this.selectionHandle,
      );
}

class ImpaktfullUiInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;
  final EdgeInsets labelMargin;
  const ImpaktfullUiInputFieldDimensTheme({
    required this.borderRadius,
    required this.labelMargin,
  });

  ImpaktfullUiInputFieldDimensTheme copyWith({
    BorderRadiusGeometry? borderRadius,
    EdgeInsets? labelMargin,
  }) =>
      ImpaktfullUiInputFieldDimensTheme(
        borderRadius: borderRadius ?? this.borderRadius,
        labelMargin: labelMargin ?? this.labelMargin,
      );
}

class ImpaktfullUiInputFieldTextStylesTheme {
  final TextStyle label;
  final TextStyle text;
  final TextStyle placeholder;
  final TextStyle hint;
  final TextStyle error;
  final TextStyle action;

  const ImpaktfullUiInputFieldTextStylesTheme({
    required this.label,
    required this.text,
    required this.placeholder,
    required this.hint,
    required this.error,
    required this.action,
  });

  ImpaktfullUiInputFieldTextStylesTheme copyWith({
    TextStyle? label,
    TextStyle? text,
    TextStyle? placeholder,
    TextStyle? hint,
    TextStyle? error,
    TextStyle? action,
  }) =>
      ImpaktfullUiInputFieldTextStylesTheme(
        label: label ?? this.label,
        text: text ?? this.text,
        placeholder: placeholder ?? this.placeholder,
        hint: hint ?? this.hint,
        error: error ?? this.error,
        action: action ?? this.action,
      );
}
