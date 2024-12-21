import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
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
                  ?.withOpacity(0.5)),
          hint: textStyles.onCardTertiary.text.small,
          error: textStyles.onCardDestructive.text.small.medium
              .copyWith(color: colors.error),
        ),
      );
}

class ImpaktfullUiDateInputFieldAssetsTheme {
  const ImpaktfullUiDateInputFieldAssetsTheme();
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
}

class ImpaktfullUiDateInputFieldDimensTheme {
  final BorderRadiusGeometry borderRadius;

  const ImpaktfullUiDateInputFieldDimensTheme({
    required this.borderRadius,
  });
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
}
