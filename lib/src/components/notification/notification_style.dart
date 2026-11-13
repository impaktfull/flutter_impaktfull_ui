import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/theme/theme.dart';
import 'package:impaktfull_ui/src/util/extension/text_style_extension.dart';

class ImpaktfullUiNotificationTheme extends ImpaktfullUiComponentTheme {
  final ImpaktfullUiNotificationAssetsTheme assets;
  final ImpaktfullUiNotificationColorTheme colors;
  final ImpaktfullUiNotificationDimensTheme dimens;
  final ImpaktfullUiNotificationShadowsTheme shadows;
  final ImpaktfullUiNotificationTextStyleTheme textStyles;

  const ImpaktfullUiNotificationTheme({
    required this.assets,
    required this.colors,
    required this.dimens,
    required this.shadows,
    required this.textStyles,
  });

  ImpaktfullUiNotificationTheme copyWith({
    ImpaktfullUiNotificationAssetsTheme? assets,
    ImpaktfullUiNotificationColorTheme? colors,
    ImpaktfullUiNotificationDimensTheme? dimens,
    ImpaktfullUiNotificationShadowsTheme? shadows,
    ImpaktfullUiNotificationTextStyleTheme? textStyles,
  }) =>
      ImpaktfullUiNotificationTheme(
        assets: assets ?? this.assets,
        colors: colors ?? this.colors,
        dimens: dimens ?? this.dimens,
        shadows: shadows ?? this.shadows,
        textStyles: textStyles ?? this.textStyles,
      );

  static ImpaktfullUiNotificationTheme of(BuildContext context) =>
      ImpaktfullUiTheme.of(context).components.notification;

  static ImpaktfullUiNotificationTheme getDefault({
    required ImpaktfullUiAssetTheme assets,
    required ImpaktfullUiColorTheme colors,
    required ImpaktfullUiTextStylesTheme textStyles,
    required ImpaktfullUiDimensTheme dimens,
    required ImpaktfullUiShadowsTheme shadows,
  }) =>
      ImpaktfullUiNotificationTheme(
        assets: ImpaktfullUiNotificationAssetsTheme(
          branded: assets.icons.confetti,
          chevronRight: assets.icons.chevronRight,
          close: assets.icons.close,
          error: assets.icons.error,
          info: assets.icons.info,
          success: assets.icons.success,
          warning: assets.icons.warning,
        ),
        colors: ImpaktfullUiNotificationColorTheme(
          background: colors.card,
          border: colors.border,
          shadow: colors.shadow,
          branded: colors.accent,
          error: colors.error,
          info: colors.info,
          success: colors.success,
          warning: colors.warning,
        ),
        dimens: ImpaktfullUiNotificationDimensTheme(
          borderRadius: dimens.borderRadius,
        ),
        shadows: ImpaktfullUiNotificationShadowsTheme(
          card: shadows.large,
        ),
        textStyles: ImpaktfullUiNotificationTextStyleTheme(
          title: textStyles.onCard.text.medium.bold,
          subtitle: textStyles.onCard.text.small,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationTheme &&
          assets == other.assets &&
          colors == other.colors &&
          dimens == other.dimens &&
          shadows == other.shadows &&
          textStyles == other.textStyles;

  @override
  int get hashCode => Object.hash(assets, colors, dimens, shadows, textStyles);
}

class ImpaktfullUiNotificationAssetsTheme {
  final ImpaktfullUiAsset? branded;
  final ImpaktfullUiAsset chevronRight;
  final ImpaktfullUiAsset close;
  final ImpaktfullUiAsset? error;
  final ImpaktfullUiAsset? info;
  final ImpaktfullUiAsset? success;
  final ImpaktfullUiAsset? warning;

  const ImpaktfullUiNotificationAssetsTheme({
    required this.branded,
    required this.chevronRight,
    required this.close,
    required this.error,
    required this.info,
    required this.success,
    required this.warning,
  });

  ImpaktfullUiNotificationAssetsTheme copyWith({
    ImpaktfullUiAsset? branded,
    ImpaktfullUiAsset? chevronRight,
    ImpaktfullUiAsset? close,
    ImpaktfullUiAsset? error,
    ImpaktfullUiAsset? info,
    ImpaktfullUiAsset? success,
    ImpaktfullUiAsset? warning,
  }) =>
      ImpaktfullUiNotificationAssetsTheme(
        branded: branded ?? this.branded,
        chevronRight: chevronRight ?? this.chevronRight,
        close: close ?? this.close,
        error: error ?? this.error,
        info: info ?? this.info,
        success: success ?? this.success,
        warning: warning ?? this.warning,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationAssetsTheme &&
          branded == other.branded &&
          chevronRight == other.chevronRight &&
          close == other.close &&
          error == other.error &&
          info == other.info &&
          success == other.success &&
          warning == other.warning;

  @override
  int get hashCode =>
      Object.hash(branded, chevronRight, close, error, info, success, warning);
}

class ImpaktfullUiNotificationColorTheme {
  final Color background;
  final Color? border;
  final Color shadow;

  /// The colour of the icon of a branded notification, and of its border with
  /// [matchBorderWithType].
  final Color branded;

  /// The background of a branded notification, or null to use [background].
  final Color? brandedBackground;

  /// The colour of the title, the subtitle, the close button and the chevron
  /// of a branded notification, or null to keep the colours of the text
  /// styles.
  final Color? brandedText;

  /// The colour of the icon of an error notification, and of its border with
  /// [matchBorderWithType].
  final Color error;

  /// The background of an error notification, or null to use [background].
  final Color? errorBackground;

  /// The colour of the text of an error notification, or null to keep the
  /// colours of the text styles. See [brandedText].
  final Color? errorText;

  /// The colour of the icon of an info notification, and of its border with
  /// [matchBorderWithType].
  final Color info;

  /// The background of an info notification, or null to use [background].
  final Color? infoBackground;

  /// The colour of the text of an info notification, or null to keep the
  /// colours of the text styles. See [brandedText].
  final Color? infoText;

  /// Whether the border has the colour of the type ([success], [warning],
  /// [error], [info] or [branded]) instead of [border].
  final bool matchBorderWithType;

  /// The colour of the icon of a success notification, and of its border with
  /// [matchBorderWithType].
  final Color success;

  /// The background of a success notification, or null to use [background].
  final Color? successBackground;

  /// The colour of the text of a success notification, or null to keep the
  /// colours of the text styles. See [brandedText].
  final Color? successText;

  /// The colour of the icon of a warning notification, and of its border with
  /// [matchBorderWithType].
  final Color warning;

  /// The background of a warning notification, or null to use [background].
  final Color? warningBackground;

  /// The colour of the text of a warning notification, or null to keep the
  /// colours of the text styles. See [brandedText].
  final Color? warningText;

  const ImpaktfullUiNotificationColorTheme({
    required this.background,
    required this.border,
    required this.shadow,
    required this.branded,
    this.brandedBackground,
    this.brandedText,
    required this.error,
    this.errorBackground,
    this.errorText,
    required this.info,
    this.infoBackground,
    this.infoText,
    this.matchBorderWithType = false,
    required this.success,
    this.successBackground,
    this.successText,
    required this.warning,
    this.warningBackground,
    this.warningText,
  });

  ImpaktfullUiNotificationColorTheme copyWith({
    Color? background,
    Color? border,
    Color? branded,
    Color? brandedBackground,
    Color? brandedText,
    Color? error,
    Color? errorBackground,
    Color? errorText,
    Color? info,
    Color? infoBackground,
    Color? infoText,
    bool? matchBorderWithType,
    Color? shadow,
    Color? success,
    Color? successBackground,
    Color? successText,
    Color? warning,
    Color? warningBackground,
    Color? warningText,
  }) =>
      ImpaktfullUiNotificationColorTheme(
        background: background ?? this.background,
        border: border ?? this.border,
        branded: branded ?? this.branded,
        brandedBackground: brandedBackground ?? this.brandedBackground,
        brandedText: brandedText ?? this.brandedText,
        error: error ?? this.error,
        errorBackground: errorBackground ?? this.errorBackground,
        errorText: errorText ?? this.errorText,
        info: info ?? this.info,
        infoBackground: infoBackground ?? this.infoBackground,
        infoText: infoText ?? this.infoText,
        matchBorderWithType: matchBorderWithType ?? this.matchBorderWithType,
        shadow: shadow ?? this.shadow,
        success: success ?? this.success,
        successBackground: successBackground ?? this.successBackground,
        successText: successText ?? this.successText,
        warning: warning ?? this.warning,
        warningBackground: warningBackground ?? this.warningBackground,
        warningText: warningText ?? this.warningText,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationColorTheme &&
          background == other.background &&
          border == other.border &&
          shadow == other.shadow &&
          branded == other.branded &&
          brandedBackground == other.brandedBackground &&
          brandedText == other.brandedText &&
          error == other.error &&
          errorBackground == other.errorBackground &&
          errorText == other.errorText &&
          info == other.info &&
          infoBackground == other.infoBackground &&
          infoText == other.infoText &&
          matchBorderWithType == other.matchBorderWithType &&
          success == other.success &&
          successBackground == other.successBackground &&
          successText == other.successText &&
          warning == other.warning &&
          warningBackground == other.warningBackground &&
          warningText == other.warningText;

  @override
  int get hashCode => Object.hash(
        background,
        border,
        shadow,
        branded,
        brandedBackground,
        brandedText,
        error,
        errorBackground,
        errorText,
        info,
        infoBackground,
        infoText,
        matchBorderWithType,
        success,
        successBackground,
        successText,
        warning,
        warningBackground,
        warningText,
      );
}

class ImpaktfullUiNotificationDimensTheme {
  final BorderRadiusGeometry borderRadius;

  /// The padding around the icon at the start of the notification.
  final EdgeInsetsGeometry leadingPadding;

  /// The padding above and below the title and the subtitle.
  final EdgeInsetsGeometry contentPadding;

  /// The space at the start and at the end of the notification, where there is
  /// no icon and no action. `px-4` of a shadcn/ui alert is 16, the
  /// `paddingContentHorizontalLG` of an Ant Design alert is 12.
  final double spacing;

  /// The space between the title and the subtitle.
  final double titleSpacing;

  /// The space around the close button and the chevron at the end.
  final double actionSpacing;

  /// The width of the border around the notification.
  final double borderWidth;

  /// Where the icon and the actions sit next to the text.
  ///
  /// `center` (the default) puts them in the middle of the notification, which
  /// is what it always did. Both design systems line the icon up with the
  /// first line of the title instead, which is `top`.
  final ImpaktfullUiNotificationAlignment alignment;

  /// The padding around the close button at the end of the notification.
  ///
  /// `null` (the default) leaves it to `ImpaktfullUiIconButtonTheme`, which
  /// is what the notification always did. An alert of a design system has a
  /// close button of its own, smaller than the icon buttons of the app: a
  /// `size-9` icon button is as tall as a shadcn/ui alert of one line.
  final EdgeInsetsGeometry? closePadding;

  /// The size of the icon in that close button. `null` (the default) leaves
  /// it to `ImpaktfullUiIconButtonTheme` as well.
  final double? closeIconSize;

  /// The size of the icon that says what kind of notification it is.
  ///
  /// `null` (the default) leaves the size to the asset, which is what the
  /// notification did before this token existed. A shadcn/ui alert draws it
  /// at `size-4` (16), an Ant Design alert with a description at
  /// `withDescriptionIconSize` (24).
  final double? iconSize;

  const ImpaktfullUiNotificationDimensTheme({
    required this.borderRadius,
    this.leadingPadding = const EdgeInsets.all(16),
    this.contentPadding = const EdgeInsets.symmetric(vertical: 16),
    this.spacing = 16,
    this.titleSpacing = 4,
    this.actionSpacing = 8,
    this.borderWidth = 1,
    this.alignment = ImpaktfullUiNotificationAlignment.center,
    this.iconSize,
    this.closePadding,
    this.closeIconSize,
  });

  ImpaktfullUiNotificationDimensTheme copyWith({
    double? actionSpacing,
    ImpaktfullUiNotificationAlignment? alignment,
    BorderRadiusGeometry? borderRadius,
    double? borderWidth,
    double? closeIconSize,
    EdgeInsetsGeometry? closePadding,
    EdgeInsetsGeometry? contentPadding,
    double? iconSize,
    EdgeInsetsGeometry? leadingPadding,
    double? spacing,
    double? titleSpacing,
  }) =>
      ImpaktfullUiNotificationDimensTheme(
        actionSpacing: actionSpacing ?? this.actionSpacing,
        alignment: alignment ?? this.alignment,
        borderRadius: borderRadius ?? this.borderRadius,
        borderWidth: borderWidth ?? this.borderWidth,
        closeIconSize: closeIconSize ?? this.closeIconSize,
        closePadding: closePadding ?? this.closePadding,
        contentPadding: contentPadding ?? this.contentPadding,
        iconSize: iconSize ?? this.iconSize,
        leadingPadding: leadingPadding ?? this.leadingPadding,
        spacing: spacing ?? this.spacing,
        titleSpacing: titleSpacing ?? this.titleSpacing,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationDimensTheme &&
          borderRadius == other.borderRadius &&
          leadingPadding == other.leadingPadding &&
          contentPadding == other.contentPadding &&
          spacing == other.spacing &&
          titleSpacing == other.titleSpacing &&
          actionSpacing == other.actionSpacing &&
          borderWidth == other.borderWidth &&
          iconSize == other.iconSize &&
          closePadding == other.closePadding &&
          closeIconSize == other.closeIconSize &&
          alignment == other.alignment;

  @override
  int get hashCode => Object.hash(
        borderRadius,
        leadingPadding,
        contentPadding,
        spacing,
        titleSpacing,
        actionSpacing,
        borderWidth,
        iconSize,
        closePadding,
        closeIconSize,
        alignment,
      );
}

class ImpaktfullUiNotificationShadowsTheme {
  final List<BoxShadow> card;

  const ImpaktfullUiNotificationShadowsTheme({
    required this.card,
  });

  ImpaktfullUiNotificationShadowsTheme copyWith({
    List<BoxShadow>? card,
  }) =>
      ImpaktfullUiNotificationShadowsTheme(
        card: card ?? this.card,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationShadowsTheme &&
          listEquals(card, other.card);

  @override
  int get hashCode => Object.hashAll(card);
}

class ImpaktfullUiNotificationTextStyleTheme {
  final TextStyle title;
  final TextStyle subtitle;
  const ImpaktfullUiNotificationTextStyleTheme({
    required this.title,
    required this.subtitle,
  });

  ImpaktfullUiNotificationTextStyleTheme copyWith({
    TextStyle? subtitle,
    TextStyle? title,
  }) =>
      ImpaktfullUiNotificationTextStyleTheme(
        subtitle: subtitle ?? this.subtitle,
        title: title ?? this.title,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImpaktfullUiNotificationTextStyleTheme &&
          title == other.title &&
          subtitle == other.subtitle;

  @override
  int get hashCode => Object.hash(title, subtitle);
}
