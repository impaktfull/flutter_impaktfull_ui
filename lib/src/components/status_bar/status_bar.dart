import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

part 'status_bar.describe.dart';

class ImpaktfullUiStatusBar extends StatelessWidget
    with ComponentDescriptorMixin {
  static final Map<Color, bool> _isColorDarkCache = {};

  final Widget child;
  final Color? backgroundColor;
  final bool? isDark;

  const ImpaktfullUiStatusBar.dark({
    required this.child,
    super.key,
  })  : isDark = true,
        backgroundColor = null;

  const ImpaktfullUiStatusBar.light({
    required this.child,
    super.key,
  })  : isDark = false,
        backgroundColor = null;

  const ImpaktfullUiStatusBar.custom({
    required this.child,
    required bool this.isDark,
    super.key,
  }) : backgroundColor = null;

  const ImpaktfullUiStatusBar.onBackgroundColor({
    required this.backgroundColor,
    required this.child,
    super.key,
  }) : isDark = null;

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    if (this.isDark != null) {
      isDark = this.isDark!;
    } else if (backgroundColor != null) {
      isDark = _isColorDark(backgroundColor!);
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.transparent)
          : SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.transparent),
      child: child,
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);

  static bool _isColorDark(Color color) {
    if (_isColorDarkCache.containsKey(color)) {
      return _isColorDarkCache[color]!;
    }
    final luminance = color.computeLuminance();
    const brightnessThreshold = 0.5;
    final isDark = luminance > brightnessThreshold;
    _isColorDarkCache[color] = isDark;
    return isDark;
  }
}
