import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/asset/asset_widget.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:impaktfull_ui_2/src/components/touch_feedback/touch_feedback.dart';
import 'package:impaktfull_ui_2/src/models/asset.dart';
import 'package:snacky/snacky.dart';

enum ImpaktfullSnackyTextType {
  title,
  subtitle,
}

class ImpaktfullSnackyBuilder extends SnackyBuilder {
  final BorderRadius? borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ImpaktfullUiSnackyConfiguratorTheme componentTheme;
  final Color Function(BuildContext, Snacky)? backgroundColorBuilder;
  final Color Function(BuildContext, Snacky)? iconColorBuilder;
  final ImpaktfullUiAsset? Function(BuildContext, Snacky)? iconBuilder;
  final BoxBorder? Function(Snacky)? borderBuilder;
  final TextStyle Function(Snacky, ImpaktfullSnackyTextType)? textStyleBuilder;

  const ImpaktfullSnackyBuilder({
    required this.componentTheme,
    this.backgroundColorBuilder,
    this.iconColorBuilder,
    this.iconBuilder,
    this.borderBuilder,
    this.textStyleBuilder,
    this.margin = const EdgeInsets.all(16),
    this.padding = const EdgeInsets.symmetric(
      vertical: 16,
    ),
    this.borderRadius,
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
    final borderRadius =
        this.borderRadius ?? componentTheme.dimens.borderRadius;
    return BaseSnackyWidget(
      cancelableSnacky: cancelableSnacky,
      snackyController: snackyController,
      margin: margin,
      borderRadius: borderRadius,
      layoutConfig: layoutConfig,
      customBuilder: builder ??
          (context, cancelableSnacky) => Container(
                width: layoutConfig.getSnackyWidth(context),
                decoration: BoxDecoration(
                  color: _getColor(context, snacky),
                  border: _getBorder(context, snacky),
                  borderRadius: borderRadius,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 20,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    if (snacky.leadingWidgetBuilder != null) ...[
                      snacky.leadingWidgetBuilder!
                          .call(context, cancelableSnacky),
                      const SizedBox(width: 8),
                    ] else ...[
                      Builder(
                        builder: (context) {
                          final leadinIcon = _getLeaderWidget(context, snacky);
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
                        padding: padding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              snacky.title,
                              style: _getTextStyle(
                                snacky,
                                ImpaktfullSnackyTextType.title,
                              ),
                            ),
                            if (snacky.subtitle != null) ...[
                              const SizedBox(height: 4),
                              Text(
                                snacky.subtitle!,
                                style: _getTextStyle(
                                  snacky,
                                  ImpaktfullSnackyTextType.subtitle,
                                ),
                              ),
                            ],
                            if (snacky.bottomWidgetBuilder != null) ...[
                              snacky.bottomWidgetBuilder!(
                                  context, cancelableSnacky),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (snacky.trailingWidgetBuilder != null) ...[
                      const SizedBox(width: 8),
                      snacky.trailingWidgetBuilder!
                          .call(context, cancelableSnacky),
                    ],
                    if (snacky.canBeClosed) ...[
                      const SizedBox(width: 8),
                      ImpaktfullUiTouchFeedback(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => cancelableSnacky.cancel(),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: ImpaktfullUiAssetWidget(
                            asset: componentTheme.assets.close,
                            color: _getTextStyle(
                                    snacky, ImpaktfullSnackyTextType.title)
                                .color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ] else if (snacky.onTap != null) ...[
                      const SizedBox(width: 8),
                      ImpaktfullUiAssetWidget(
                        asset: componentTheme.assets.chevronRight,
                        color: _getTextStyle(
                                snacky, ImpaktfullSnackyTextType.title)
                            .color,
                      ),
                      const SizedBox(width: 16),
                    ] else ...[
                      const SizedBox(width: 16),
                    ],
                  ],
                ),
              ),
    );
  }

  Color _getColor(BuildContext context, Snacky snacky) {
    if (backgroundColorBuilder != null) {
      return backgroundColorBuilder!.call(context, snacky);
    }
    final theme = ImpaktfullUiSnackyConfiguratorTheme.of(context);
    return theme.colors.background;
  }

  BoxBorder? _getBorder(BuildContext context, Snacky snacky) {
    if (borderBuilder != null) {
      return borderBuilder!.call(snacky);
    }
    final theme = ImpaktfullUiSnackyConfiguratorTheme.of(context);
    final borderColor = theme.colors.border;
    if (borderColor == null) return null;
    return Border.all(
      color: borderColor,
      width: 1,
    );
  }

  Color _getSnackyTypeColor(BuildContext context, Snacky snacky) {
    if (iconColorBuilder != null) {
      return iconColorBuilder!.call(context, snacky);
    }

    final theme = ImpaktfullUiSnackyConfiguratorTheme.of(context);
    switch (snacky.type) {
      case SnackyType.success:
        return theme.colors.success;
      case SnackyType.error:
        return theme.colors.error;
      case SnackyType.warning:
        return theme.colors.warning;
      case SnackyType.info:
        return theme.colors.info;
      case SnackyType.branded:
        return theme.colors.brand;
    }
  }

  TextStyle _getTextStyle(Snacky snacky, ImpaktfullSnackyTextType textType) {
    if (textStyleBuilder != null) {
      return textStyleBuilder!.call(snacky, textType);
    }
    switch (textType) {
      case ImpaktfullSnackyTextType.title:
        return const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
      case ImpaktfullSnackyTextType.subtitle:
        return const TextStyle(color: Colors.black, fontSize: 12);
    }
  }

  ImpaktfullUiAsset? _getIcon(BuildContext context, Snacky snacky) {
    if (iconBuilder != null) {
      return iconBuilder!.call(context, snacky);
    }
    final theme = ImpaktfullUiSnackyConfiguratorTheme.of(context);
    switch (snacky.type) {
      case SnackyType.success:
        return theme.assets.success;
      case SnackyType.error:
        return theme.assets.error;
      case SnackyType.warning:
        return theme.assets.warning;
      case SnackyType.info:
        return theme.assets.info;
      case SnackyType.branded:
        return theme.assets.branded;
    }
  }

  Widget? _getLeaderWidget(BuildContext context, Snacky snacky) {
    final color = _getSnackyTypeColor(context, snacky);
    final asset = _getIcon(context, snacky);
    if (asset == null) return null;
    return ImpaktfullUiAssetWidget(
      asset: asset,
      color: color,
    );
  }
}
