import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';
import 'package:impaktfull_ui_2/src/util/extension/text_style_extension.dart';

class ImpaktfullUiInputFieldTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiInputFieldColorTheme colors;
  final ImpaktfullUiInputFieldDimensTheme dimens;
  final ImpaktfullUiInputFieldTextStylesTheme textStyles;

  const ImpaktfullUiInputFieldTheme({
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

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
        colors: ImpaktfullUiInputFieldColorTheme(
          background: colors.card,
          border: colors.border,
          borderError: colors.error,
          cursor: colors.accent,
          selection: colors.accent.withOpacity(0.3),
          selectionHandle: colors.accent,
        ),
        dimens: ImpaktfullUiInputFieldDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiInputFieldTextStylesTheme(
          label: textStyles.onCard.text.small.medium,
          text: textStyles.onCard.text.medium,
          placeholder: textStyles.onCardTertiary.text.medium.copyWith(
              color: textStyles.onCardTertiary.text.medium.color
                  ?.withOpacity(0.5)),
          hint: textStyles.onCardTertiary.text.small,
          error: textStyles.onCardDestructive.text.small.medium
              .copyWith(color: colors.error),
          action: textStyles.onCard.text.small.medium,
        ),
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
}

class ImpaktfullUiInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;
  const ImpaktfullUiInputFieldDimensTheme({
    required this.borderRadius,
  });
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
}
