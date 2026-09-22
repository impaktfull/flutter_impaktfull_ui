import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui/src/components/icon_button/icon_button_style.dart';
import 'package:impaktfull_ui/src/components/interaction_feedback/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge.dart';
import 'package:impaktfull_ui/src/models/asset.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'icon_button_style.dart';

void _noop() {}

class ImpaktfullUiIconButton extends StatelessWidget {
  final VoidCallback? _onTap;
  final Color? color;
  final ImpaktfullUiAsset asset;
  final double? _size;
  final String? tooltip;
  final Color? backgroundColor;
  final bool canRequestFocus;
  final bool showNotificationBadge;
  final String? notificationBadgeText;
  final Color? notificationBadgeColor;
  final ImpaktfullUiIconButtonTheme? theme;

  const ImpaktfullUiIconButton({
    /// Called when the icon button is tapped. When null, the icon button is
    /// disabled: it can not be tapped or focused and is shown with the
    /// `disabledOpacity` of the theme.
    required VoidCallback? onTap,
    required this.asset,
    this.color,
    double? size,
    this.backgroundColor,
    this.tooltip,
    this.canRequestFocus = true,
    this.showNotificationBadge = false,
    this.notificationBadgeText,
    this.notificationBadgeColor,
    this.theme,
    super.key,
  })  : _onTap = onTap,
        _size = size;

  /// The callback of the icon button, or a function that does nothing when
  /// the icon button is disabled (see [isDisabled]).
  VoidCallback get onTap => _onTap ?? _noop;

  /// Whether the icon button is enabled: it has an `onTap`.
  bool get isEnabled => _onTap != null;

  /// The size of the icon that was passed to the constructor, or 16 (the
  /// size of the default theme) when none was passed. Without a size, the
  /// icon has the `iconSize` of the [ImpaktfullUiIconButtonTheme].
  double get size => _size ?? 16;

  /// Whether the icon button is disabled: it has no `onTap`.
  bool get isDisabled => !isEnabled;

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final touchFeedback = ImpaktfullUiTouchFeedback(
          tooltip: tooltip,
          borderRadius: componentTheme.dimens.borderRadius,
          onTap: _onTap,
          color: backgroundColor ?? componentTheme.colors.background,
          canRequestFocus: canRequestFocus && !isDisabled,
          child: Padding(
            padding: componentTheme.dimens.padding,
            child: ImpaktfullUiNotificationBadge(
              // A badge with a text is shown, even when `showNotificationBadge` is false.
              show: showNotificationBadge || notificationBadgeText != null,
              color: notificationBadgeColor ??
                  componentTheme.colors.notificationBadge,
              text: notificationBadgeText,
              size: componentTheme.dimens.notificationBadgeSize,
              child: ImpaktfullUiAssetWidget(
                asset: asset,
                color: color ?? componentTheme.colors.icon,
                size: _size ?? componentTheme.dimens.iconSize,
              ),
            ),
          ),
        );
        final button = Semantics(
          container: true,
          button: true,
          enabled: isEnabled,
          child: touchFeedback,
        );
        if (!isDisabled) return button;
        return Opacity(
          opacity: componentTheme.dimens.disabledOpacity,
          child: button,
        );
      },
    );
  }

  ImpaktfullUiIconButton overrideColor(Color color) {
    if (this.color != null) return this;
    return ImpaktfullUiIconButton(
      onTap: _onTap,
      asset: asset,
      color: color,
      size: _size,
      tooltip: tooltip,
      backgroundColor: backgroundColor,
      canRequestFocus: canRequestFocus,
      showNotificationBadge: showNotificationBadge,
      notificationBadgeText: notificationBadgeText,
      notificationBadgeColor: notificationBadgeColor,
      theme: theme,
      key: key,
    );
  }
}
