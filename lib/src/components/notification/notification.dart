import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/auto_layout/auto_layout.dart';
import 'package:impaktfull_ui_2/src/components/icon_button/icon_button.dart';
import 'package:impaktfull_ui_2/src/components/notification/notification.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:snacky/snacky.dart';

export 'notification_style.dart';

part 'notification.describe.dart';

enum ImpaktfullUiNotificationType {
  success,
  warning,
  error,
  info,
  branded,
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

class ImpaktfullUiNotification extends StatelessWidget with ComponentDescriptorMixin {
  final String title;
  final String? subtitle;
  final double? width;
  final VoidCallback? onCloseTapped;
  final VoidCallback? onTap;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)? leadingWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)? trailingWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)? centerWidgetBuilder;
  final Widget Function(BuildContext, ImpaktfullUiNotificationTypeConfig)? bottomWidgetBuilder;
  final ImpaktfullUiNotificationType type;
  final ImpaktfullUiNotificationAlignment alignment;
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
    this.alignment = ImpaktfullUiNotificationAlignment.center,
    this.theme,
    super.key,
  });

  static show({
    required String title,
    String? subtitle,
  }) =>
      SnackyController.instance.showMessage(
        (context) => Snacky(
          title: title,
          subtitle: subtitle,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiNotificationTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final crossAxisAlignment = _getAlignment();
        final config = _getNotificationTypeConfig(componentTheme);
        return Container(
          width: width,
          decoration: BoxDecoration(
            color: componentTheme.colors.background,
            border: _getBorder(componentTheme),
            borderRadius: componentTheme.dimens.borderRadius,
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 50,
              ),
            ],
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
                          final leadinIcon = _getLeaderWidget(config);
                          if (leadinIcon == null) {
                            return const SizedBox(width: 16);
                          }
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: leadinIcon,
                          );
                        },
                      ),
                    ],
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title,
                              style: componentTheme.textStyles.title,
                            ),
                            if (subtitle != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                subtitle!,
                                style: componentTheme.textStyles.subtitle,
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
                      const SizedBox(width: 8),
                      Padding(
                        padding: EdgeInsets.only(
                          top: crossAxisAlignment == CrossAxisAlignment.start ? 8 : 0,
                          bottom: crossAxisAlignment == CrossAxisAlignment.end ? 8 : 0,
                        ),
                        child: ImpaktfullUiIconButton(
                          onTap: onCloseTapped!,
                          asset: componentTheme.assets.close,
                          color: componentTheme.textStyles.title.color,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ] else if (onTap != null) ...[
                      const SizedBox(width: 8),
                      ImpaktfullUiAssetWidget(
                        asset: componentTheme.assets.chevronRight,
                        color: componentTheme.textStyles.title.color,
                      ),
                      const SizedBox(width: 16),
                    ] else ...[
                      const SizedBox(width: 16),
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
      width: 1,
    );
  }

  ImpaktfullUiNotificationTypeConfig _getNotificationTypeConfig(ImpaktfullUiNotificationTheme theme) {
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

  ImpaktfullUiAsset? _getNotificationTypeIcon(ImpaktfullUiNotificationTheme theme) {
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

  Widget? _getLeaderWidget(ImpaktfullUiNotificationTypeConfig config) {
    final asset = config.asset;
    if (asset == null) return null;
    return ImpaktfullUiAssetWidget(
      asset: asset,
      color: config.color,
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  CrossAxisAlignment _getAlignment() {
    switch (alignment) {
      case ImpaktfullUiNotificationAlignment.top:
        return CrossAxisAlignment.start;
      case ImpaktfullUiNotificationAlignment.center:
        return CrossAxisAlignment.center;
      case ImpaktfullUiNotificationAlignment.bottom:
        return CrossAxisAlignment.end;
    }
  }
}
