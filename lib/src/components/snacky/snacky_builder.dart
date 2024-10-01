import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/impaktfull_ui.dart';
import 'package:impaktfull_ui_2/src/components/snacky/snacky_configurator_style.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ImpaktfullSnackyTextType {
  title,
  subtitle,
}

class ImpaktfullSnackyBuilder extends SnackyBuilder {
  final BorderRadius? borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final Color Function(Snacky)? colorBuilder;
  final BoxBorder Function(Snacky)? borderBuilder;
  final TextStyle Function(Snacky, ImpaktfullSnackyTextType)? textStyleBuilder;

  const ImpaktfullSnackyBuilder({
    this.colorBuilder,
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
    final theme = ImpaktfullUiSnackyConfiguratorTheme.of(context);
    final snacky = cancelableSnacky.snacky;
    final customBuilder = snacky.builder;
    final borderRadius = this.borderRadius ?? theme.dimens.borderRadius;
    return BaseSnackyWidget(
      cancelableSnacky: cancelableSnacky,
      snackyController: snackyController,
      margin: margin,
      borderRadius: borderRadius,
      layoutConfig: layoutConfig,
      customBuilder: customBuilder ??
          (context, cancelableSnacky) => Container(
                width: layoutConfig.getSnackyWidth(context),
                decoration: BoxDecoration(
                  color: _getColor(snacky),
                  border: _getBorder(snacky),
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
                      snacky.leadingWidgetBuilder!.call(context, cancelableSnacky),
                      const SizedBox(width: 8),
                    ] else ...[
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: _getLeaderWidget(snacky),
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
                              snacky.bottomWidgetBuilder!(context, cancelableSnacky),
                            ],
                          ],
                        ),
                      ),
                    ),
                    if (snacky.trailingWidgetBuilder != null) ...[
                      const SizedBox(width: 8),
                      snacky.trailingWidgetBuilder!.call(context, cancelableSnacky),
                    ],
                    if (snacky.canBeClosed) ...[
                      const SizedBox(width: 8),
                      ImpaktfullUiTouchFeedback(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => cancelableSnacky.cancel(),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Icon(
                            Icons.close,
                            color: _getTextStyle(snacky, ImpaktfullSnackyTextType.title).color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                    ] else if (snacky.onTap != null) ...[
                      const SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: _getTextStyle(snacky, ImpaktfullSnackyTextType.title).color,
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

  Color _getColor(Snacky snacky) {
    if (colorBuilder != null) {
      return colorBuilder!.call(snacky);
    }
    return Colors.white;
  }

  BoxBorder _getBorder(Snacky snacky) {
    if (borderBuilder != null) {
      return borderBuilder!.call(snacky);
    }
    return Border.all(
      color: const Color.fromARGB(255, 215, 215, 215),
      width: 1,
    );
  }

  Color _getSnackyTypeColor(Snacky snacky) {
    switch (snacky.type) {
      case SnackyType.success:
        return Colors.green;
      case SnackyType.error:
        return Colors.red;
      case SnackyType.warning:
        return Colors.orange;
      case SnackyType.info:
        return Colors.blue;
      case SnackyType.branded:
        return ImpaktfullUiTheme.defaultAccent;
    }
  }

  TextStyle _getTextStyle(Snacky snacky, ImpaktfullSnackyTextType textType) {
    if (textStyleBuilder != null) {
      return textStyleBuilder!.call(snacky, textType);
    }
    switch (textType) {
      case ImpaktfullSnackyTextType.title:
        return const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
      case ImpaktfullSnackyTextType.subtitle:
        return const TextStyle(color: Colors.black, fontSize: 12);
    }
  }

  IconData _getIcon(Snacky snacky) {
    switch (snacky.type) {
      case SnackyType.success:
        return PhosphorIcons.checkCircle();
      case SnackyType.error:
        return Icons.error;
      case SnackyType.warning:
        return Icons.error;
      case SnackyType.info:
        return Icons.info;
      case SnackyType.branded:
        return Icons.info;
    }
  }

  Widget _getLeaderWidget(Snacky snacky) {
    return Container(
      decoration: BoxDecoration(
        color: _getSnackyTypeColor(snacky),
        shape: BoxShape.circle,
      ),
      child: Icon(
        _getIcon(snacky),
        color: Colors.white,
        size: 24,
      ),
    );
  }
}
