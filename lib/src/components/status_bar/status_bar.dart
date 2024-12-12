import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:impaktfull_ui/src/util/descriptor/component_descriptor_mixin.dart';

part 'status_bar.describe.dart';

class ImpaktfullUiStatusBar extends StatelessWidget
    with ComponentDescriptorMixin {
  final Widget child;
  final bool isDark;

  const ImpaktfullUiStatusBar.dark({
    required this.child,
    super.key,
  }) : isDark = true;

  const ImpaktfullUiStatusBar.light({
    required this.child,
    super.key,
  }) : isDark = false;

  const ImpaktfullUiStatusBar.custom({
    required this.child,
    required this.isDark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
