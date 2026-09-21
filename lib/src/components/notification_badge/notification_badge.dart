import 'package:flutter/material.dart';
import 'package:impaktfull_ui/src/components/notification_badge/notification_badge_style.dart';
import 'package:impaktfull_ui/src/widget/override_components/overridable_component_builder.dart';

export 'notification_badge_style.dart';

/// The corner of the child where the badge is shown.
///
/// Left and right follow the reading direction: in a right-to-left layout
/// (e.g. Arabic or Hebrew) [topRight] shows the badge in the top-left corner,
/// the end of the reading direction.
enum ImpaktfullUiNotificationBadgeLocation {
  // rtl-ignore: public physical alignment, kept for compatibility. The badge
  // itself follows the reading direction.
  bottomRight(Alignment.bottomRight),
  bottomLeft(Alignment.bottomLeft),
  topRight(Alignment.topRight),
  topLeft(Alignment.topLeft);

  final Alignment alignment;

  const ImpaktfullUiNotificationBadgeLocation(this.alignment);
}

class ImpaktfullUiNotificationBadge extends StatelessWidget {
  static const dotSize = 4.0;

  final bool show;
  final Color? color;
  final String? text;
  final Widget child;
  final double size;
  final ImpaktfullUiNotificationBadgeLocation location;
  final ImpaktfullUiNotificationBadgeTheme? theme;

  const ImpaktfullUiNotificationBadge({
    required this.show,
    required this.child,
    required this.color,
    this.size = 16,
    this.location = ImpaktfullUiNotificationBadgeLocation.topRight,
    this.text,
    this.theme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ImpaktfullUiOverridableComponentBuilder(
      component: this,
      overrideComponentTheme: theme,
      builder: (context, componentTheme) {
        final color = this.color ?? componentTheme.colors.background;
        final textStyle = componentTheme.textStyles.text;
        final textSize = _textSize(
          text ?? '',
          textStyle,
          textDirection: Directionality.maybeOf(context) ?? TextDirection.ltr,
          textScaler:
              MediaQuery.maybeTextScalerOf(context) ?? TextScaler.noScaling,
        );
        final textWidth = textSize.width + 12;
        final textHeight = textSize.height;
        return Stack(
          clipBehavior: Clip.none,
          children: [
            child,
            // Left and right locations follow the reading direction: in a
            // right-to-left layout `topRight` is the top-left corner.
            PositionedDirectional(
              top: _getTop(dotSize, textWidth, textHeight),
              bottom: _getBottom(dotSize, textWidth, textHeight),
              end: _getEnd(dotSize, textWidth, textHeight),
              start: _getStart(dotSize, textWidth, textHeight),
              child: AnimatedOpacity(
                opacity: show ? 1 : 0,
                duration: componentTheme.durations.opacity,
                child: Transform.scale(
                  scale: 0.75,
                  child: Container(
                    constraints: BoxConstraints(
                      minWidth: size,
                      minHeight: size,
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
                          padding: componentTheme.dimens.textPadding,
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

  Size _textSize(
    String text,
    TextStyle style, {
    required TextDirection textDirection,
    required TextScaler textScaler,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      textDirection: textDirection,
      textScaler: textScaler,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    final size = textPainter.size;
    textPainter.dispose();
    return size;
  }

  bool get _isTop =>
      location == ImpaktfullUiNotificationBadgeLocation.topLeft ||
      location == ImpaktfullUiNotificationBadgeLocation.topRight;

  bool get _isEnd =>
      location == ImpaktfullUiNotificationBadgeLocation.topRight ||
      location == ImpaktfullUiNotificationBadgeLocation.bottomRight;

  double? _getTop(double dotSize, double textWidth, double textHeight) {
    if (!_isTop) return null;
    if (text == null) return -(dotSize / 2);
    return -(textHeight / 2);
  }

  double? _getBottom(double dotSize, double textWidth, double textHeight) {
    if (_isTop) return null;
    if (text == null) return -(dotSize / 2);
    return -(textHeight / 2);
  }

  double? _getEnd(double dotSize, double textWidth, double textHeight) {
    if (!_isEnd) return null;
    if (text == null) return -(dotSize / 2);
    return -(textWidth / 2);
  }

  double? _getStart(double dotSize, double textWidth, double textHeight) {
    if (_isEnd) return null;
    if (text == null) return -(dotSize / 2);
    return -(textWidth / 2);
  }
}
