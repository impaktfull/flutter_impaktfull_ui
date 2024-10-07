import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/components/notification_badge/notification_badge_style.dart';
import 'package:impaktfull_ui_2/src/components/theme/theme_component_builder.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';

export 'notification_badge_style.dart';

part 'notification_badge.describe.dart';

enum ImpaktfullUiNotificationBadgeLocation {
  bottomRight(Alignment.bottomRight),
  bottomLeft(Alignment.bottomLeft),
  topRight(Alignment.topRight),
  topLeft(Alignment.topLeft);

  final Alignment alignment;

  const ImpaktfullUiNotificationBadgeLocation(this.alignment);
}

class ImpaktfullUiNotificationBadge extends StatelessWidget with ComponentDescriptorMixin {
  static const dotSize = 4.0;

  final bool show;
  final Color? color;
  final String? text;
  final Widget child;
  final ImpaktfullUiNotificationBadgeLocation location;
  final ImpaktfullUiNotificationBadgeTheme? theme;

  const ImpaktfullUiNotificationBadge({
    required this.show,
    required this.child,
    required this.color,
    this.location = ImpaktfullUiNotificationBadgeLocation.topRight,
    this.text,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiComponentThemeBuidler<ImpaktfullUiNotificationBadgeTheme>(
      overrideComponentTheme: theme,
      builder: (context, theme, componentTheme) {
        final showBadge = show || text != null;
        final color = this.color ?? componentTheme.colors.background;
        final textStyle = componentTheme.textStyles.text;
        final textSize = _textWidth(text ?? '', textStyle);
        final textWidth = textSize.width + 12;
        final textHeight = textSize.height;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            child,
            Positioned(
              top: _getTop(dotSize, textWidth, textHeight),
              bottom: _getBottom(dotSize, textWidth, textHeight),
              right: _getRight(dotSize, textWidth, textHeight),
              left: _getLeft(dotSize, textWidth, textHeight),
              child: AnimatedOpacity(
                opacity: showBadge ? 1 : 0,
                duration: componentTheme.durations.opacity,
                child: Transform.scale(
                  scale: 0.75,
                  child: Container(
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: componentTheme.dimens.borderRadius,
                      border: componentTheme.colors.border == null
                          ? null
                          : Border.all(
                              color: componentTheme.colors.border!,
                              width: 2,
                              strokeAlign: BorderSide.strokeAlignOutside,
                            ),
                    ),
                    alignment: Alignment.center,
                    child: Builder(
                      builder: (context) {
                        if (text == null) {
                          return Container(
                            width: dotSize,
                            height: dotSize,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: componentTheme.dimens.borderRadius,
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            text ?? '',
                            style: componentTheme.textStyles.text,
                            textAlign: TextAlign.center,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Size _textWidth(String text, TextStyle style) {
    final TextPainter textPainter =
        TextPainter(text: TextSpan(text: text, style: style), maxLines: 1, textDirection: TextDirection.ltr)
          ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  double? _getTop(double dotSize, double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.bottomCenter ||
        alignment == Alignment.bottomLeft ||
        alignment == Alignment.bottomRight) {
      return null;
    }
    if (text == null) return -(dotSize / 2);
    return -(textHeight / 2);
  }

  double? _getBottom(double dotSize, double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.topCenter || alignment == Alignment.topLeft || alignment == Alignment.topRight) {
      return null;
    }
    if (text == null) return -(dotSize / 2);
    return -(textHeight / 2);
  }

  double? _getRight(double dotSize, double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.centerLeft || alignment == Alignment.topLeft || alignment == Alignment.bottomLeft) {
      return null;
    }
    if (text == null) return -(dotSize / 2);
    return -(textWidth / 2);
  }

  double? _getLeft(double dotSize, double textWidth, double textHeight) {
    final alignment = location.alignment;
    if (alignment == Alignment.centerRight || alignment == Alignment.topRight || alignment == Alignment.bottomRight) {
      return null;
    }
    if (text == null) return -(dotSize / 2);
    return -(textWidth / 2);
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
