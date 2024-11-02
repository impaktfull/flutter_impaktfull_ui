import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/notification/notification.dart';
import 'package:impaktfull_ui/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui/src/util/extension/border_radius_geometry_extension.dart';
import 'package:snacky/snacky.dart';

enum ImpaktfullSnackyTextType {
  title,
  subtitle,
}

class ImpaktfullSnackyBuilder extends SnackyBuilder {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ImpaktfullUiSnackyConfiguratorTheme componentTheme;

  const ImpaktfullSnackyBuilder({
    required this.componentTheme,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
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
      margin: margin,
      borderRadius: borderRadius.value, //todo fix in snacky
      layoutConfig: layoutConfig,
      customBuilder: builder ??
          (context, cancelableSnacky) => ImpaktfullUiNotification(
                title: snacky.title,
                subtitle: snacky.subtitle,
                width: layoutConfig.getSnackyWidth(context),
                onTap: snacky.onTap,
                onCloseTapped: snacky.canBeClosed ? () => cancelableSnacky.cancel() : null,
                trailingWidgetBuilder: snacky.trailingWidgetBuilder == null
                    ? null
                    : (context, config) => snacky.trailingWidgetBuilder!(context, cancelableSnacky),
                leadingWidgetBuilder: snacky.leadingWidgetBuilder == null
                    ? null
                    : (context, config) => snacky.leadingWidgetBuilder!(context, cancelableSnacky),
                centerWidgetBuilder: snacky.bottomWidgetBuilder == null
                    ? null
                    : (context, config) => snacky.bottomWidgetBuilder!(context, cancelableSnacky),
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
