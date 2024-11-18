import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui_2/src/theme/theme.dart';

class ImpaktfullUiChatTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiChatAssetsTheme assets;
  final ImpaktfullUiChatColorTheme colors;
  final ImpaktfullUiChatDimensTheme dimens;
  final ImpaktfullUiChatTextStyleTheme textStyles;

  const ImpaktfullUiChatTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.textStyles,
  });

  static ImpaktfullUiChatTheme of(BuildContext context) => ImpaktfullUiTheme.of(context).components.chat;

  static ImpaktfullUiChatTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiDurationTheme durations,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiChatTheme(
        assets: const ImpaktfullUiChatAssetsTheme(),
        colors: ImpaktfullUiChatColorTheme(
          ownMessageBackground: colors.accent,
          ownMessageBorder: colors.accent,
          otherMessageBackground: colors.card,
          otherMessageBorder: colors.border,
          dateLabelBackground: colors.primary,
          typingContainerBackground: colors.border,
          typingContainerDots: colors.border.withOpacity(1),
        ),
        dimens: ImpaktfullUiChatDimensTheme(
          messagePadding: 8,
          dateLabelBorderRadius: dimens.borderRadius,
          typingContainerBorderRadius: dimens.borderRadius,
          typingDotsBorderRadius: dimens.borderRadius,
        ),
        textStyles: ImpaktfullUiChatTextStyleTheme(
          otherMessage: textStyles.onCard.text.small,
          ownMessage: textStyles.onAccent.text.small,
          dateLabel: textStyles.onPrimary.text.small,
        ),
      );
}

class ImpaktfullUiChatAssetsTheme {
  const ImpaktfullUiChatAssetsTheme();
}

class ImpaktfullUiChatColorTheme {
  final Color ownMessageBackground;
  final Color ownMessageBorder;
  final Color otherMessageBackground;
  final Color otherMessageBorder;
  final Color dateLabelBackground;
  final Color typingContainerBackground;
  final Color typingContainerDots;

  const ImpaktfullUiChatColorTheme({
    required this.ownMessageBackground,
    required this.ownMessageBorder,
    required this.otherMessageBackground,
    required this.otherMessageBorder,
    required this.dateLabelBackground,
    required this.typingContainerBackground,
    required this.typingContainerDots,
  });
}

class ImpaktfullUiChatDimensTheme {
  final double messagePadding;
  final BorderRadiusGeometry dateLabelBorderRadius;
  final BorderRadiusGeometry typingContainerBorderRadius;
  final BorderRadiusGeometry typingDotsBorderRadius;

  const ImpaktfullUiChatDimensTheme({
    required this.messagePadding,
    required this.dateLabelBorderRadius,
    required this.typingContainerBorderRadius,
    required this.typingDotsBorderRadius,
  });
}

class ImpaktfullUiChatTextStyleTheme {
  final TextStyle ownMessage;
  final TextStyle otherMessage;
  final TextStyle dateLabel;
  const ImpaktfullUiChatTextStyleTheme({
    required this.ownMessage,
    required this.otherMessage,
    required this.dateLabel,
  });
}
