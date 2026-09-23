import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/color_extensions.dart';

class ImpaktfullUiChatTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiChatAssetsTheme assets;
  final ImpaktfullUiChatColorTheme colors;
  final ImpaktfullUiChatDimensTheme dimens;
  final ImpaktfullUiChatDurationsTheme durations;
  final ImpaktfullUiChatTextStyleTheme textStyles;

  const ImpaktfullUiChatTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    this.durations = const ImpaktfullUiChatDurationsTheme(),
    required this.textStyles,
  });

  ImpaktfullUiChatTheme copyWith({
    ImpaktfullUiChatAssetsTheme? assets,
    ImpaktfullUiChatColorTheme? colors,
    ImpaktfullUiChatDimensTheme? dimens,
    ImpaktfullUiChatDurationsTheme? durations,
    ImpaktfullUiChatTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiChatTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        durations: durations ?? this.durations,
        textStyles: textStyles ?? this.textStyles,
      );

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
          dateLabelBackground: colors.primary,
          typingContainerBackground: colors.border,
          typingContainerDots: colors.border.withOpacityPercentage(1),
          onlineBadge: colors.success,
        ),
        dimens: ImpaktfullUiChatDimensTheme(
          messagePadding: 8,
          dateLabelBorderRadius: dimens.borderRadius,
          typingContainerBorderRadius: dimens.borderRadius,
          typingDotsBorderRadius: dimens.borderRadius,
        ),
        durations: const ImpaktfullUiChatDurationsTheme(),
        textStyles: ImpaktfullUiChatTextStyleTheme(
          otherMessage: textStyles.onCard.text.small,
          ownMessage: textStyles.onAccent.text.small,
          dateLabel: textStyles.onPrimary.text.small,
        ),
      );
}

class ImpaktfullUiChatAssetsTheme {
  const ImpaktfullUiChatAssetsTheme();

  ImpaktfullUiChatAssetsTheme copyWith() => const ImpaktfullUiChatAssetsTheme();
}

class ImpaktfullUiChatColorTheme {
  final Color ownMessageBackground;
  final Color ownMessageBorder;
  final Color otherMessageBackground;
  final Color otherMessageBorder;
  final Color dateLabelBackground;
  final Color typingContainerBackground;
  final Color typingContainerDots;
  final Color onlineBadge;

  const ImpaktfullUiChatColorTheme({
    required this.ownMessageBackground,
    required this.ownMessageBorder,
    required this.otherMessageBackground,
    required this.otherMessageBorder,
    required this.dateLabelBackground,
    required this.typingContainerBackground,
    required this.typingContainerDots,
    required this.onlineBadge,
  });

  ImpaktfullUiChatColorTheme copyWith({
    Color? dateLabelBackground,
    Color? onlineBadge,
    Color? otherMessageBackground,
    Color? otherMessageBorder,
    Color? ownMessageBackground,
    Color? ownMessageBorder,
    Color? typingContainerBackground,
    Color? typingContainerDots,
  }) =>
      ImpaktfullUiChatColorTheme(
        dateLabelBackground: dateLabelBackground ?? this.dateLabelBackground,
        onlineBadge: onlineBadge ?? this.onlineBadge,
        otherMessageBackground:
            otherMessageBackground ?? this.otherMessageBackground,
        otherMessageBorder: otherMessageBorder ?? this.otherMessageBorder,
        ownMessageBackground: ownMessageBackground ?? this.ownMessageBackground,
        ownMessageBorder: ownMessageBorder ?? this.ownMessageBorder,
        typingContainerBackground:
            typingContainerBackground ?? this.typingContainerBackground,
        typingContainerDots: typingContainerDots ?? this.typingContainerDots,
      );
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

  ImpaktfullUiChatDimensTheme copyWith({
    BorderRadiusGeometry? dateLabelBorderRadius,
    double? messagePadding,
    BorderRadiusGeometry? typingContainerBorderRadius,
    BorderRadiusGeometry? typingDotsBorderRadius,
  }) =>
      ImpaktfullUiChatDimensTheme(
        dateLabelBorderRadius:
            dateLabelBorderRadius ?? this.dateLabelBorderRadius,
        messagePadding: messagePadding ?? this.messagePadding,
        typingContainerBorderRadius:
            typingContainerBorderRadius ?? this.typingContainerBorderRadius,
        typingDotsBorderRadius:
            typingDotsBorderRadius ?? this.typingDotsBorderRadius,
      );
}

class ImpaktfullUiChatDurationsTheme {
  /// How long one bounce of a dot of the typing indicator takes.
  final Duration typingDot;

  /// The delay between the bounce of one typing dot and the next one.
  final Duration typingDotDelay;

  const ImpaktfullUiChatDurationsTheme({
    this.typingDot = const Duration(milliseconds: 800),
    this.typingDotDelay = const Duration(milliseconds: 200),
  });

  ImpaktfullUiChatDurationsTheme copyWith({
    Duration? typingDot,
    Duration? typingDotDelay,
  }) =>
      ImpaktfullUiChatDurationsTheme(
        typingDot: typingDot ?? this.typingDot,
        typingDotDelay: typingDotDelay ?? this.typingDotDelay,
      );
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

  ImpaktfullUiChatTextStyleTheme copyWith({
    TextStyle? dateLabel,
    TextStyle? otherMessage,
    TextStyle? ownMessage,
  }) =>
      ImpaktfullUiChatTextStyleTheme(
        dateLabel: dateLabel ?? this.dateLabel,
        otherMessage: otherMessage ?? this.otherMessage,
        ownMessage: ownMessage ?? this.ownMessage,
      );
}
