import 'package:flutter/material.dart';
import 'package:impaktfull_ui_2/src/util/descriptor/component_descriptor_mixin.dart';
import 'package:impaktfull_ui_2/src/util/device_util/device_util.dart';

part 'adaptive_safe_area.describe.dart';

class ImpaktfullUiAdaptiveSafeArea extends StatelessWidget
    with ComponentDescriptorMixin {
  final Widget child;
  final bool top;
  final bool bottom;
  final bool start;
  final bool end;
  final bool hasMacOsMenuBar;
  const ImpaktfullUiAdaptiveSafeArea({
    required this.child,
    this.top = true,
    this.bottom = true,
    this.start = true,
    this.end = true,
    this.hasMacOsMenuBar = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final direction = Directionality.of(context);
    return SafeArea(
      top: top,
      bottom: bottom,
      left: direction == TextDirection.ltr ? start : end,
      right: direction == TextDirection.ltr ? end : start,
      child: Builder(
        builder: (context) {
          if (DeviceUtil.isMacOs()) {
            return Padding(
              padding: EdgeInsets.only(top: hasMacOsMenuBar ? 0 : 22),
              child: child,
            );
          }
          return child;
        },
      ),
    );
  }

  @override
  String describe(BuildContext context) => _describeInstance(context, this);
}
