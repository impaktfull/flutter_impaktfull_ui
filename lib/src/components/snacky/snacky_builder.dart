import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:snacky/snacky.dart';

enum ImpaktfullUiSnackyTextType {
  title,
  subtitle,
}

/// The look of a snack of the default theme.
///
/// Every value comes from [componentTheme], so an app changes the look through
/// its theme. A theme that needs another layout altogether passes its own
/// `SnackyBuilder` in `ImpaktfullUiSnackyConfiguratorTheme.snackyBuilder`.
class ImpaktfullUiSnackyBuilder extends SnackyBuilder {
  final ImpaktfullUiSnackyConfiguratorTheme componentTheme;

  const ImpaktfullUiSnackyBuilder({
    required this.componentTheme,
  });

  @override
  Widget build(
    BuildContext context,
    SnackyLayoutConfig layoutConfig,
    CancelableSnacky cancelableSnacky,
    SnackyController snackyController,
  ) {
    final snacky = cancelableSnacky.snacky;
    final builder = snacky.builder;
    final borderRadius = componentTheme.dimens.borderRadius;
    return BaseSnackyWidget(
      cancelableSnacky: cancelableSnacky,
      snackyController: snackyController,
      margin: componentTheme.dimens.margin,
      borderRadius: borderRadius.value, //todo fix in snacky
      layoutConfig: layoutConfig,
      customBuilder: builder ??
          (context, cancelableSnacky) => ImpaktfullUiNotification(
                title: snacky.title,
                subtitle: snacky.subtitle,
                width: layoutConfig.getSnackyWidth(context),
                onTap: snacky.onTap,
                onCloseTapped:
                    snacky.canBeClosed ? () => cancelableSnacky.cancel() : null,
                trailingWidgetBuilder: snacky.trailingWidgetBuilder == null
                    ? null
                    : (context, config) => snacky.trailingWidgetBuilder!(
                        context, cancelableSnacky),
                leadingWidgetBuilder: snacky.leadingWidgetBuilder == null
                    ? null
                    : (context, config) =>
                        snacky.leadingWidgetBuilder!(context, cancelableSnacky),
                centerWidgetBuilder: snacky.bottomWidgetBuilder == null
                    ? null
                    : (context, config) =>
                        snacky.bottomWidgetBuilder!(context, cancelableSnacky),
                type: _getType(snacky),
              ),
    );
  }

  ImpaktfullUiNotificationType _getType(Snacky snacky) {
    switch (snacky.type) {
      case SnackyType.success:
        return ImpaktfullUiNotificationType.success;
      case SnackyType.error:
        return ImpaktfullUiNotificationType.error;
      case SnackyType.warning:
        return ImpaktfullUiNotificationType.warning;
      case SnackyType.info:
        return ImpaktfullUiNotificationType.info;
      case SnackyType.branded:
        return ImpaktfullUiNotificationType.branded;
    }
  }
}
