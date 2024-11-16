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

  static ImpaktfullUiChatTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.chat;

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
        ),
        dimens: const ImpaktfullUiChatDimensTheme(
          messagePadding: 8,
        ),
        textStyles: ImpaktfullUiChatTextStyleTheme(
          otherMessage: textStyles.onCard.text.small,
          ownMessage: textStyles.onAccent.text.small,
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

  const ImpaktfullUiChatColorTheme({
    required this.ownMessageBackground,
    required this.ownMessageBorder,
    required this.otherMessageBackground,
    required this.otherMessageBorder,
  });
}

class ImpaktfullUiChatDimensTheme {
  final double messagePadding;

  const ImpaktfullUiChatDimensTheme({
    required this.messagePadding,
  });
}

class ImpaktfullUiChatTextStyleTheme {
  final TextStyle ownMessage;
  final TextStyle otherMessage;

  const ImpaktfullUiChatTextStyleTheme({
    required this.ownMessage,
    required this.otherMessage,
  });
}
