import 'package:material_ui/material_ui.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';
import 'package:snacky/snacky.dart';

export 'notification_style.dart';

enum ImpaktfullUiNotificationType {
  success(SnackyType.success),
  warning(SnackyType.warning),
  error(SnackyType.error),
  info(SnackyType.info),
  branded(SnackyType.branded);

  final SnackyType _snackyType;

  const ImpaktfullUiNotificationType(this._snackyType);
}

enum ImpaktfullUiNotificationAlignment {
  top,
  center,
  bottom,
}

class ImpaktfullUiNotificationTypeConfig {
  final Color color;
  final ImpaktfullUiAsset? asset;

  const ImpaktfullUiNotificationTypeConfig({
    required this.color,
    required this.asset,
  });
}

class ImpaktfullUiNotification extends StatelessWidget {
  final String title;
  final String? subtitle;
  final double? width;
  final VoidCallback? onCloseTapped;
  final VoidCallback? onTap;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)?
      leadingWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)?
      trailingWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)?
      centerWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)?
      bottomWidgetBuilder;
  final ImpaktfullUiNotificationType type;

  /// Where the icon and the actions sit next to the text, or null to take it
  /// from `ImpaktfullUiNotificationDimensTheme.alignment`.
  final ImpaktfullUiNotificationAlignment? alignment;
  final ImpaktfullUiNotificationTheme? theme;

  const ImpaktfullUiNotification({
    required this.title,
    this.subtitle,
    this.width,
    this.onCloseTapped,
    this.onTap,
    this.leadingWidgetBuilder,
    this.trailingWidgetBuilder,
    this.centerWidgetBuilder,
    this.bottomWidgetBuilder,
    this.type = ImpaktfullUiNotificationType.success,
    this.alignment,
    this.theme,
    super.key,
  });

  /// Shows a notification with the snacky controller of the app.
  ///
  /// The controller is, in this order: [controller], the `snackyController`
  /// of the `ImpaktfullUiApp` or `ImpaktfullUiSnackyConfigurator` above
  /// [context], or [SnackyController.instance]. Pass [context] (or
  /// [controller]) when you pass a custom `snackyController` to the app.
  ///
  /// By default ([cancelAll] is true) the new notification replaces every
  /// notification: the one on screen and the ones that are waiting in the
  /// queue. Pass `cancelAll: false` to queue it after the others instead, and
  /// `cancelActive: true` (with `cancelAll: false`) to only replace the one
  /// on screen and keep the queue.
  ///
  /// [onTap], [leading], [trailing] and [width] are passed to the
  /// [ImpaktfullUiNotification]. Without [width] the notification takes the
  /// width of the snacky layout of the configurator. When one of them is
  /// passed, the notification is always an [ImpaktfullUiNotification], also
  /// when the app has a custom `snackyBuilder`.
  static void show({
    required String title,
    String? subtitle,
    Duration? showDuration,
    bool cancelActive = false,
    bool cancelAll = true,
    ImpaktfullUiNotificationType type = ImpaktfullUiNotificationType.success,
    BuildContext? context,
    SnackyController? controller,
    VoidCallback? onTap,
    Widget? leading,
    Widget? trailing,
    double? width,
  }) {
    final snackyController = controller ??
        (context == null
            ? null
            : ImpaktfullUiSnackyConfigurator.maybeSnackyControllerOf(
                context)) ??
        SnackyController.instance;
    if (cancelActive) {
      snackyController.cancelActiveSnacky();
    }
    if (cancelAll) {
      snackyController.cancelAll();
    }
    if (onTap == null && leading == null && trailing == null && width == null) {
      snackyController.showMessage(
        (context) => Snacky(
          title: title,
          subtitle: subtitle,
          type: type._snackyType,
          showDuration: showDuration,
          canBeClosed: true,
        ),
      );
      return;
    }
    snackyController.showMessage(
      (context) => Snacky.widget(
        showDuration: showDuration ??
            Snacky(title: title, subtitle: subtitle).showDuration,
        canBeClosed: true,
        builder: (context, cancelableSnacky) => ImpaktfullUiNotification(
          title: title,
          subtitle: subtitle,
          width: width,
          type: type,
          onTap: onTap,
          onCloseTapped: cancelableSnacky.cancel,
          leadingWidgetBuilder:
              leading == null ? null : (context, config) => leading,
          trailingWidgetBuilder:
              trailing == null ? null : (context, config) => trailing,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final crossAxisAlignment = _getAlignment(componentTheme);
        final config = _getNotificationTypeConfig(componentTheme);
        final textColor = _getTextColor(componentTheme);
        final titleStyle = textColor == null
            ? componentTheme.textStyles.title
            : componentTheme.textStyles.title.copyWith(color: textColor);
        final subtitleStyle = textColor == null
            ? componentTheme.textStyles.subtitle
            : componentTheme.textStyles.subtitle.copyWith(color: textColor);
        final notification = Container(
          width: width,
          decoration: BoxDecoration(
            color: _getBackgroundColor(componentTheme),
            border: _getBorder(componentTheme),
            borderRadius: componentTheme.dimens.borderRadius,
            boxShadow: componentTheme.shadows.card,
          ),
          child: ClipRRect(
            borderRadius: componentTheme.dimens.borderRadius,
            child: ImpaktfullUiAutoLayout.vertical(
              mainAxisSize: MainAxisSize.min,
              children: [
                ImpaktfullUiAutoLayout.horizontal(
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    if (leadingWidgetBuilder != null) ...[
                      leadingWidgetBuilder!.call(context, config),
                    ] else ...[
                      Builder(
                        builder: (context) {
                          final leadinIcon =
                              _getLeaderWidget(config, componentTheme);
                          if (leadinIcon == null) {
                            return SizedBox(
                              width: componentTheme.dimens.spacing,
                            );
                          }
                          return Padding(
                            padding: componentTheme.dimens.leadingPadding,
                            child: leadinIcon,
                          );
                        },
                      ),
                    ],
                    Expanded(
                      child: Padding(
                        padding: componentTheme.dimens.contentPadding,
                        child: ImpaktfullUiAutoLayout.vertical(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: titleStyle,
                            ),
                            if (subtitle != null) ...[
                              SizedBox(
                                height: componentTheme.dimens.titleSpacing,
                              ),
                              Text(
                                subtitle!,
                                style: subtitleStyle,
                              ),
                            ],
                            if (centerWidgetBuilder != null) ...[
                              centerWidgetBuilder!(context, config),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (trailingWidgetBuilder != null) ...[
                      trailingWidgetBuilder!.call(context, config),
                    ],
                    if (onCloseTapped != null) ...[
                      SizedBox(width: componentTheme.dimens.actionSpacing),
                      Padding(
                        padding: EdgeInsets.only(
                          top: crossAxisAlignment == CrossAxisAlignment.start
                              ? componentTheme.dimens.actionSpacing
                              : 0,
                          bottom: crossAxisAlignment == CrossAxisAlignment.end
                              ? componentTheme.dimens.actionSpacing
                              : 0,
                        ),
                        child: ImpaktfullUiIconButton(
                          onTap: onCloseTapped!,
                          asset: componentTheme.assets.close,
                          color: titleStyle.color,
                          size: componentTheme.dimens.closeIconSize,
                          theme: _getCloseButtonTheme(context, componentTheme),
                        ),
                      ),
                      SizedBox(width: componentTheme.dimens.actionSpacing),
                    ] else if (onTap != null) ...[
                      SizedBox(width: componentTheme.dimens.actionSpacing),
                      ImpaktfullUiAssetWidget(
                        asset: componentTheme.assets.chevronRight
                            .copyWith(matchTextDirection: true),
                        color: titleStyle.color,
                      ),
                      SizedBox(width: componentTheme.dimens.spacing),
                    ] else ...[
                      SizedBox(width: componentTheme.dimens.spacing),
                    ],
                  ],
                ),
                if (bottomWidgetBuilder != null) ...[
                  bottomWidgetBuilder!(context, config),
                ],
              ],
            ),
          ),
        );
        if (onTap == null) return notification;
        return ImpaktfullUiTouchFeedback(
          onTap: onTap,
          borderRadius: componentTheme.dimens.borderRadius,
          child: notification,
        );
      },
    );
  }

  BoxBorder? _getBorder(ImpaktfullUiNotificationTheme theme) {
    final Color? borderColor;
    if (theme.colors.matchBorderWithType) {
      borderColor = _getNotificationTypeColor(theme);
    } else {
      borderColor = theme.colors.border;
    }
    if (borderColor == null) return null;
    return Border.all(
      color: borderColor,
      width: theme.dimens.borderWidth,
    );
  }

  /// The background of [type], or the shared background when the theme has
  /// none for it.
  Color _getBackgroundColor(ImpaktfullUiNotificationTheme theme) {
    final colors = theme.colors;
    final Color? background;
    switch (type) {
      case ImpaktfullUiNotificationType.success:
        background = colors.successBackground;
      case ImpaktfullUiNotificationType.error:
        background = colors.errorBackground;
      case ImpaktfullUiNotificationType.warning:
        background = colors.warningBackground;
      case ImpaktfullUiNotificationType.info:
        background = colors.infoBackground;
      case ImpaktfullUiNotificationType.branded:
        background = colors.brandedBackground;
    }
    return background ?? colors.background;
  }

  /// The colour of the text of [type], or null to keep the colours of the
  /// text styles.
  Color? _getTextColor(ImpaktfullUiNotificationTheme theme) {
    final colors = theme.colors;
    switch (type) {
      case ImpaktfullUiNotificationType.success:
        return colors.successText;
      case ImpaktfullUiNotificationType.error:
        return colors.errorText;
      case ImpaktfullUiNotificationType.warning:
        return colors.warningText;
      case ImpaktfullUiNotificationType.info:
        return colors.infoText;
      case ImpaktfullUiNotificationType.branded:
        return colors.brandedText;
    }
  }

  ImpaktfullUiNotificationTypeConfig _getNotificationTypeConfig(
      ImpaktfullUiNotificationTheme theme) {
    return ImpaktfullUiNotificationTypeConfig(
      color: _getNotificationTypeColor(theme),
      asset: _getNotificationTypeIcon(theme),
    );
  }

  Color _getNotificationTypeColor(ImpaktfullUiNotificationTheme theme) {
    switch (type) {
      case ImpaktfullUiNotificationType.success:
        return theme.colors.success;
      case ImpaktfullUiNotificationType.error:
        return theme.colors.error;
      case ImpaktfullUiNotificationType.warning:
        return theme.colors.warning;
      case ImpaktfullUiNotificationType.info:
        return theme.colors.info;
      case ImpaktfullUiNotificationType.branded:
        return theme.colors.branded;
    }
  }

  ImpaktfullUiAsset? _getNotificationTypeIcon(
      ImpaktfullUiNotificationTheme theme) {
    switch (type) {
      case ImpaktfullUiNotificationType.success:
        return theme.assets.success;
      case ImpaktfullUiNotificationType.error:
        return theme.assets.error;
      case ImpaktfullUiNotificationType.warning:
        return theme.assets.warning;
      case ImpaktfullUiNotificationType.info:
        return theme.assets.info;
      case ImpaktfullUiNotificationType.branded:
        return theme.assets.branded;
    }
  }

  Widget? _getLeaderWidget(
    ImpaktfullUiNotificationTypeConfig config,
    ImpaktfullUiNotificationTheme componentTheme,
  ) {
    final asset = config.asset;
    if (asset == null) return null;
    return ImpaktfullUiAssetWidget(
      asset: asset,
      color: config.color,
      size: componentTheme.dimens.iconSize,
    );
  }

  /// The theme of the close button, with the padding the notification asks
  /// for.
  ///
  /// It starts from the icon button theme that is already in the tree, so an
  /// app that themes its icon buttons keeps everything but the padding. It
  /// returns `null` when the notification has nothing to say, which leaves
  /// the button exactly as it was.
  ImpaktfullUiIconButtonTheme? _getCloseButtonTheme(
    BuildContext context,
    ImpaktfullUiNotificationTheme componentTheme,
  ) {
    final padding = componentTheme.dimens.closePadding;
    if (padding == null) return null;
    final iconButtonTheme = ImpaktfullUiIconButtonTheme.of(context);
    return iconButtonTheme.copyWith(
      dimens: iconButtonTheme.dimens.copyWith(padding: padding),
    );
  }

  CrossAxisAlignment _getAlignment(ImpaktfullUiNotificationTheme theme) {
    switch (alignment ?? theme.dimens.alignment) {
      case ImpaktfullUiNotificationAlignment.top:
        return CrossAxisAlignment.start;
      case ImpaktfullUiNotificationAlignment.center:
        return CrossAxisAlignment.center;
      case ImpaktfullUiNotificationAlignment.bottom:
        return CrossAxisAlignment.end;
    }
  }
}
